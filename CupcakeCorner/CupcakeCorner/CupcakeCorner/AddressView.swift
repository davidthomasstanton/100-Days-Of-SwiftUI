//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/9/24.
//

import SwiftUI

// struct AddressView
// pass in Order
// Enter name, street address, city, zip
// navigation for checkout that is disabled unless there's a valid address

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Checkout") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
