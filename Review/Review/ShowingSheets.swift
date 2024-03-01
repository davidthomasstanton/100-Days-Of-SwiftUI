//
//  ShowingSheets.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct SecondView: View {
    var name = ""
    var body: some View {
        Text("Howdy \(name)!")
    }
}
struct ShowingSheets: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Greet Dave") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Dave")
        }
    }
}

#Preview {
    ShowingSheets()
}
