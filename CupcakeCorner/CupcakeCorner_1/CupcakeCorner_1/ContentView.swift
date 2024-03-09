//
//  ContentView.swift
//  CupcakeCorner_1
//
//  Created by David Stanton on 3/9/24.
//
// ContentView :: Nav Stack, Form
// Section 1: Picker to select cake type, Stepper for number of cakes (3-20)
// Section 2: Toggles for special requests, extra frosting, extra spinkles
// Section 3: Navlink to AddressView for delivery details
//
// Order :: Observable class
// static types of Vanilla, Strawberry, Chocolate, Rainbow
// type, quantity, specialRequestEnabled, extraFrosting, addSprinkles
// specialRequestEnabled sets others to false if false
//
// AddressView :: struct
// pass in Order

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select Cake Type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Cupcake Quantity: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Special Requests", isOn: $order.specialRequestEnabled)
                    if order.specialRequestEnabled {
                        Toggle("Extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Add Sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink("Delivery Details", destination: AddressView(order: order))
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
