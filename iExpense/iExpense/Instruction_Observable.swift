//
//  Instruction_Observable.swift
//  iExpense
//
//  Created by David Stanton on 2/12/24.
//

import SwiftUI
import Observation

@Observable
class user {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}


struct Instruction_Observable: View {

    @State private var user = User()
    
    var body: some View {
        Text("Your name is \(user.firstName) \(user.lastName).")
        
        TextField("First Name", text: $user.firstName)
        TextField("Last Name", text: $user.lastName)
    }
}

#Preview {
    Instruction_Observable()
}
