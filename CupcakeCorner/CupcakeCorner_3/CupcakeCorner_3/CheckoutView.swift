//
//  CheckoutView.swift
//  CupcakeCorner_3
//
//  Created by David Stanton on 3/12/24.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingError = false
    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is: \(order.totalCost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .font(.body.bold())
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .font(.title)
                Spacer()
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Thank You!", isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text(confirmationMessage)
            }
            .alert("Oops", isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(confirmationMessage)
            }
        }
    }
    
    func placeOrder() async {
        // encode JSON data
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode data into JSON")
            return
        }
        
        // force unwrap string into URL: "https://reqres.in/api/cupcakes"
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
            let decoded = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order of \(decoded.quantity)x \(Order.types[decoded.type]) cupcakes is on its way!"
            showingConfirmation = true
            
        } catch {
            confirmationMessage = "Failed to connect \(error.localizedDescription)"
            showingError = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
