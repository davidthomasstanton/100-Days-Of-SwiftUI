//
//  NavigationDestination_1.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

struct NavigationDestination_1: View {
    var body: some View {
//        NavigationStack {
//            List(0..<100) { i in
//                NavigationLink("Item \(i)", value: i)
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }
        
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select: \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    NavigationDestination_1()
}
