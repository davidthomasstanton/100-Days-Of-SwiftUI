//
//  ContentView.swift
//  iExpense
//
//  Created by David Stanton on 2/12/24.
//

import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}
struct ContentView: View {
    @State private var user = User()
    
    var body: some View {

        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
