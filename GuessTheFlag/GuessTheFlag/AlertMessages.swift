//
//  AlertMessages.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/25/24.
//

import SwiftUI

struct AlertMessages: View {
    @State private var showingAlert: Bool = false
    
    var body: some View {
        Button("show alert") {
            showingAlert = true
        }
        
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
        
        Text("Hallo")
    }
}

#Preview {
    AlertMessages()
}
