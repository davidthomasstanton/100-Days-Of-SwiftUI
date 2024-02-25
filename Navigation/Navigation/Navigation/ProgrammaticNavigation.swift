//
//  ProgrammaticNavigation.swift
//  Navigation
//
//  Created by David Stanton on 2/24/24.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                // more to come
            }
            .navigationDestination(for: Int.self) { selection in
            Text("You have selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigation()
}
