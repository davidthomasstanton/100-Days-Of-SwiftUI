//
//  NavigationPath_2.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

//struct DetailView: View {
//    var number: Int
//    var body: some View {
//        NavigationLink("Go to a random number", value: Int.random(in: 0...1000))
//            .navigationTitle("Number: \(number)")
//    }
//}
//struct NavigationPath_2: View {
//    @State private var path = [Int]()
//    var body: some View {
//        NavigationStack(path: $path) {
//            DetailView(number: 0)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i)
//                }
//        }
//    }
//}
struct DetailView: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 0...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Go to start") {
                    path.removeAll()
                }
            }
    }
}
struct NavigationPath_2: View {
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
    NavigationPath_2()
}
