//
//  SwipeActions_2.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//

import SwiftUI

struct SwipeActions_2: View {
    var body: some View {
        List {
            Text("Swipe for options")
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        print("Deleted")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinned")
                    }
                    .tint(.cyan)
                }
            
        }
    }
}

#Preview {
    SwipeActions_2()
}
