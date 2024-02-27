//
//  RandomNumber_1.swift
//  Navigation
//
//  Created by David Stanton on 2/26/24.
//

import SwiftUI
struct RandomView1: View {
    var number: Int
    @Binding var path: [Int]
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 0...1000))
            .navigationTitle("Random Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}
struct RandomNumber_1: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            RandomView1(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    RandomView1(number: i, path: $path)
                }
        }
    }
}

#Preview {
    RandomNumber_1()
}
