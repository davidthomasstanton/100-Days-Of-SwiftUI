//
//  ContentView.swift
//  CupcakeCorner_3
//
//  Created by David Stanton on 3/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Cupcake Type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Amount: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Add Extra Additions", isOn: $order.extraAdditions)
                    if order.extraAdditions {
                        Toggle("Extra Sprinkles", isOn: $order.addSprinkles)
                        Toggle("Extra Frosting", isOn: $order.addExtraFrosting)
                    }
                }
                Section {
                    NavigationLink("Add Delivery Address", destination: AddAddressView(order: order))
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
