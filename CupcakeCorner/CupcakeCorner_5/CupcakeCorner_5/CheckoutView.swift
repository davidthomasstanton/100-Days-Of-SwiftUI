//
//  CheckoutView.swift
//  CupcakeCorner_5
//
//  Created by David Stanton on 3/14/24.
//
// Load Image "https://hws.dev/img/cupcakes@3x.jpg" with a placeholder spinny-wheel
// Display total cost in local currency
// Button to place order
// handle alerts for successful order and failed order
//
// placeOrder function
// encode the order
// create a url request for "https://reqres.in/api/cupcakes"
// request has a value of "application/json" with a headerfield of "Content-Type"
// "POST" method
// create a URLSession for the request
// decode results
// handle errors and create confirmation Message

import SwiftUI

struct CheckoutView: View {
    @Bindable var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                Text("Total Cost for \(order.quantity) \(Order.types[order.type]) Cupcakes: \(order.cost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .font(.system(size: 20))
                Button {
                    Task {
                        await placeOrder()
                    }
                } label: {
                    Text("Place Order")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Thank you!", isPresented: $showingConfirmation) {
                Button("OK, I'll be patient") { }
            } message: {
                Text(confirmationMessage)
            }
            .alert("Oops!", isPresented: $showingError) {
                Button("Bummer.") { }
            } message: {
                Text(confirmationMessage)
            }
        }
    }
    
    func placeOrder() async {
        // placeOrder function
        // encode the order
        // create a url request for "https://reqres.in/api/cupcakes"
        // request has a value of "application/json" with a headerfield of "Content-Type"
        // "POST" method
        // create a URLSession for the request
        // decode results
        // handle errors and create confirmation Message
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order as JSON")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decoded = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order of \(decoded.quantity) \(Order.types[decoded.type]) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            confirmationMessage = "Error creating order \(error.localizedDescription)"
            showingError = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
