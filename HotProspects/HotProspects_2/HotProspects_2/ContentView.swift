//
//  ContentView.swift
//  HotProspects_2
//
//  Created by David Stanton on 4/23/24.
//
// ContentView
// TabView with 3 ProspectsView filtered for...
// Everyone "person.3", Contacted, "checkmark.circle", Uncontacted "questionmark.diamond"
// Me, "person.crop.square"
// ProspectsView
// enum for FilterType (none, contacted, uncontacted)
// set a filter and a title that switches by the filter

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    ContentView()
}
