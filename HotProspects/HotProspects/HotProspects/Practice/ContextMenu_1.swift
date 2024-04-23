//
//  ContextMenu_1.swift
//  HotProspects
//
//  Created by David Stanton on 4/22/24.
//

import SwiftUI

struct ContextMenu_1: View {
    @State private var bgColor = Color.red
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(bgColor)

            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: bgColor == .red ? "checkmark.circle.fill" : "circle") {
                        bgColor = .red
                    }
                    Button("Yellow", systemImage: bgColor == .yellow ? "checkmark.circle.fill" : "circle") {
                        bgColor = .yellow
                    }

                    Button("Blue", systemImage: bgColor == .blue ? "checkmark.circle.fill" : "circle") {
                        bgColor = .blue
                    }

                }
                .clipShape(.capsule)
        }
        
    }
}

#Preview {
    ContextMenu_1()
}
