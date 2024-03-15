//
//  ContentView.swift
//  Bookworm
//
//  Created by David Stanton on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    var body: some View {
        NavigationStack {
            Form {
                TextEditor(text: $notes)
                    .padding()
                TextField("Enter text", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .navigationTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
}
