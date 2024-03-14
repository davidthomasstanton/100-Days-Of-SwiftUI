//
//  CheckoutView.swift
//  CupcakeCorner_1
//
//  Created by David Stanton on 3/11/24.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingOrderFailed = false
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your order is \(order.cost, format: .currency(code: "USD"))")
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank You", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Order Failed :( ", isPresented: $showingOrderFailed) {
            Button("Reassessing Life Choices") { }
        } message: {
            Text(confirmationMessage)
        }
            
    }
    func placeOrder() async {
        // encode JSON data
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode data to JSON")
            return
        }
        // force unwrap string into URL "https://reqres.in/api/cupcakes"
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        // create URLRequest of "Content-Type", "application/json", httpMethod of "POST"
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        // upload encoded data in a URLSession for request
        // handle the result
        // decode the data
        // create a confirmation message
        // catch any errors
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order of \(decodedOrder.quantity)x \(Order.types[decodedOrder.type]) cupcakes is on its way"
            showingConfirmation = true
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
            confirmationMessage = "Failed to connect to the internet. Please try again."
            showingOrderFailed = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
