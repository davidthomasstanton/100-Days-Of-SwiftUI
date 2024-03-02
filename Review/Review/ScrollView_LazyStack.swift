//
//  ScrollView_LazyStack.swift
//  Review
//
//  Created by David Stanton on 3/1/24.
//

import SwiftUI

struct ScrollView_LazyStack: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollView_LazyStack()
}
