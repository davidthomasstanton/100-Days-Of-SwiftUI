//
//  ProgrammaticNavigation_1.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

struct ProgrammaticNavigation_1: View {
//    @State private var path = [Int]()
//    var body: some View {
//        NavigationStack(path: $path) {
//            VStack {
//                Button("Go to 32, then 64") {
//                    path = [32, 64]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You have gone to \(selection)")
//            }
//        }
//
//    }
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Go to 32") {
                    path = [32]
                }
                Button("Go to 64") {
                    path.append(64)
                }
                Button("Go to 32, then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You have selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigation_1()
}
