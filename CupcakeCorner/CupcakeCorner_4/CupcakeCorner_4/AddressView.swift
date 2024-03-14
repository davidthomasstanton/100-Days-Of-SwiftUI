//
//  AddressView.swift
//  CupcakeCorner_4
//
//  Created by David Stanton on 3/13/24.
//
// struct AddressView
// pass in Order
// Enter name, street address, city, zip
// navigation for checkout that is disabled unless there's a valid address

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    var body: some View {
        NavigationStack {
            Section {
                Form {
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }
                
                NavigationLink("Checkout") {
                    CheckoutView(order: order)
                }
                .disabled(order.hasValidAddress == false)
            }
        }
    }
}

#Preview {
    AddressView(order: Order())
}
