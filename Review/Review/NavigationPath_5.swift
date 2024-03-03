//
//  NavigationPath_5.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI
struct DetailView_5: View {
    @Binding var path: NavigationPath
    var number: Int
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Restart") {
                    path = NavigationPath()
                }
            }
    }
}
struct NavigationPath_5: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            DetailView_5(path: $path, number: 0)
                .navigationDestination(for: Int.self) { num in
                    DetailView_5(path: $path, number: num)
                }
        }
    }
}

#Preview {
    NavigationPath_5()
}
