//
//  ConfirmationView.swift
//  Instafilter
//
//  Created by David Stanton on 3/30/24.
//

import SwiftUI

struct ConfirmationView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    var body: some View {
        Button("confirmationDialog Test") {
            showingConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change Background Color", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Yellow") { backgroundColor = .yellow }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Change background color")
        }
    }
}

#Preview {
    ConfirmationView()
}
