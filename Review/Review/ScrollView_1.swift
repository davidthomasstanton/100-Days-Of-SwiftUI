//
//  ScrollView_1.swift
//  Review
//
//  Created by David Stanton on 3/1/24.
//

import SwiftUI

struct ScrollView_1: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollView_1()
}
