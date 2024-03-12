//
//  CheckoutView.swift
//  CupcakeCorner_2
//
//  Created by David Stanton on 3/11/24.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    
                    Text("Your total cost is \(order.cost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    Button("Place Order") {
                        Task {
                            await placeOrder()
                        }
                    }
                }
            }
            .navigationTitle("Checkout")
            .scrollBounceBehavior(.basedOnSize)
            .alert("Thank You!", isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text(confirmationMessage)
            }
        }
    }
    func placeOrder() async {
        
    }
}

#Preview {
    CheckoutView(order: Order())
}
