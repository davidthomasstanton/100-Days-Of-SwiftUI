//
//  RandomNumber.swift
//  Navigation
//
//  Created by David Stanton on 2/26/24.
//

import SwiftUI
struct RandomView: View {
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

struct RandomNumber: View {
    @State var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            RandomView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    RandomView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    RandomNumber(path: [0])
}
