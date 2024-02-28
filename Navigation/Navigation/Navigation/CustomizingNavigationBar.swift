//
//  CustomizingNavigationBar.swift
//  Navigation
//
//  Created by David Stanton on 2/27/24.
//

import SwiftUI

struct CustomizingNavigationBar: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomizingNavigationBar()
}
