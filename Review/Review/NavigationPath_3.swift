//
//  NavigationPath_3.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

struct DetailView_3 {
    var number: Int
    @Binding var path: [Int]
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Restart") {
                    path.removeAll()
                }
            }
    }
}
struct NavigationPath_3: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    NavigationPath_3()
}
