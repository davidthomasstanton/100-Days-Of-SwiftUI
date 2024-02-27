//
//  RandomNumber_3.swift
//  Navigation
//
//  Created by David Stanton on 2/26/24.
//

import SwiftUI
struct RandomView3: View {
    var number: Int
    @Binding var path: NavigationPath
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 0...1000))
            .navigationTitle("Random Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}
struct RandomNumber_3: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            RandomView3(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    RandomView3(number: i, path: $path)
                }
        }
    }
}

#Preview {
    RandomNumber_3()
}
