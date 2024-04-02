//
//  ContentUnavailableView.swift
//  Instafilter
//
//  Created by David Stanton on 4/1/24.
//

import SwiftUI

struct ContentUnavailableView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            
        }
    }
}

#Preview {
    ContentUnavailableView()
}
