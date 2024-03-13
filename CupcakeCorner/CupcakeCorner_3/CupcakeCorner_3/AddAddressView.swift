//
//  AddAddressView.swift
//  CupcakeCorner_3
//
//  Created by David Stanton on 3/9/24.
//

import SwiftUI

struct AddAddressView: View {
    @Bindable var order: Order
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Delivery Instructions")
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

#Preview {
    AddAddressView(order: Order())
}
