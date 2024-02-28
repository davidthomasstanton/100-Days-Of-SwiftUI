//
//  NavigationBar_Editable.swift
//  Navigation
//
//  Created by David Stanton on 2/27/24.
//

import SwiftUI

struct NavigationBar_Editable: View {
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationBar_Editable()
}
