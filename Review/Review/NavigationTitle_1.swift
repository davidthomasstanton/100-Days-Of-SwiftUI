//
//  NavigationTitle_1.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

struct NavigationTitle_1: View {
    @State private var title = "Greeting"
    var body: some View {
        NavigationStack {
            Text("Hello World")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    NavigationTitle_1()
}
