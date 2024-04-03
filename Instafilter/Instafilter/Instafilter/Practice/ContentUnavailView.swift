//
//  ContentUnavailView.swift
//  Instafilter
//
//  Created by David Stanton on 4/2/24.
//

import SwiftUI

struct ContentUnavailView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("There are no snippets available")
        } actions: {
            Button("Create snippet") {
                
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentUnavailView()
}
