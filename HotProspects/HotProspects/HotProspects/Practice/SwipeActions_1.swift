//
//  SwipeActions_1.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//

import SwiftUI

struct SwipeActions_1: View {
    var body: some View {
        List {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .swipeActions {
                    Button("Delete", systemImage: "delete", role: .destructive) {
                        print("Deleted")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.yellow)
                }
        }
    }
}

#Preview {
    SwipeActions_1()
}
