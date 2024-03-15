//
//  ContentView.swift
//  CupcakeCorner_5
//
//  Created by David Stanton on 3/14/24.
//
// Nav Stack, Form
// Section 1: Picker to select cake type, Stepper for number of cakes (3-20)
// Section 2: Toggles for special requests, extra frosting, extra spinkles
// Section 3: Navlink to AddressView for delivery details

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Section {
                Form {
                    Stepper("Quantity: \(order.quantity)", value: $order.quantity, in: 3...20)
                    Picker("Cupcake Type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                    Toggle("Special Requests", isOn: $order.specialRequestEnabled)
                    if order.specialRequestEnabled {
                        Toggle("Extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Add Extra Sprinkles", isOn: $order.addSprinkles)
                    }
                    NavigationLink("Delivery Instructions") {
                        AddressView(order: order)
                    }

                }
                
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
