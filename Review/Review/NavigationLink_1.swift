//
//  NavigationLink_1.swift
//  Review
//
//  Created by David Stanton on 3/1/24.
//

import SwiftUI

struct NavigationLink_1: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail of Row \(row)")
                }
            }
        }
    }
}

#Preview {
    NavigationLink_1()
}
