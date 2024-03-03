//
//  NavigationPath_1.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

struct NavigationPath_1: View {
//    @State private var path = NavigationPath()
//    var body: some View {
//        NavigationStack(path: $path) {
//            VStack {
//                Text("Hello")
//            }
//            .toolbar {
//                Button("Go to 32") {
//                    path.append(32)
//                }
//                Button("Go to NewView") {
//                    path.append("NewView")
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You have gone to \(selection)")
//            }
//            .navigationDestination(for: String.self) { selection in
//                Text("You have gone to string: \(selection)")
//            }
//        }
//    }
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("")
            }
            .toolbar {
                Button("Go to #32") {
                    path.append(32)
                }
                Button("Go to Hello") {
                    path.append("Hello!")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You have gone to #\(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You have gone to string: \(selection)")
            }
        }
    }
}

#Preview {
    NavigationPath_1()
}
