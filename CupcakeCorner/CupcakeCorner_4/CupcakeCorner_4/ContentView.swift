//
//  ContentView.swift
//  CupcakeCorner_4
//
//  Created by David Stanton on 3/13/24.
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
            Form {
                Section {
                    Picker("Cupcake Type:", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Quantity: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Special Requests", isOn: $order.specialRequestEnabled)
                    if order.specialRequestEnabled == true {
                        Toggle("Extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Add Extra Spinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink("Delivery Details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("CupcakeCorner")
        }
    }
}

#Preview {
    ContentView()
}
