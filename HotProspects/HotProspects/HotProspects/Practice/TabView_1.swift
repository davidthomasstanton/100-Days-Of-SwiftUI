//
//  TabView_1.swift
//  HotProspects
//
//  Created by David Stanton on 4/22/24.
//

import SwiftUI

struct TabView_1: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                Text("Tab 1")
                    .font(.title)
                Button("Show Tab 2") {
                    selectedTab = "Two"
                }
            }
            .tabItem {
                Label("Tab 1", systemImage: "star")
            }
            .tag("One")
            VStack {
                Text("Tab 2")
                    .font(.title)
                Button("Show Tab 1") {
                    selectedTab = "One"
                }
            }
            .tabItem {
                Label("Tab 2", systemImage: "circle")
            }
            .tag("Two")
        }
    }
}

#Preview {
    TabView_1()
}
