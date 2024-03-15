//
//  AddressView.swift
//  CupcakeCorner_5
//
//  Created by David Stanton on 3/14/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zip)
            }
            .navigationTitle("Delivery Instructinos")
        }
        NavigationLink("Checkout") {
            CheckoutView(order: order)
        }
        .disabled(order.hasValidAddress == false)
    }
}

#Preview {
    AddressView(order: Order())
}
