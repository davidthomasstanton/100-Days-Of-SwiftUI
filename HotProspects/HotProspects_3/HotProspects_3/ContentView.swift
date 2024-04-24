//
//  ContentView.swift
//  HotProspects_3
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
// In a NavStack, Text of "People: #of people"
// toolbar with a button "qrcode.viewfinder" to add a prospect
// Prospect data observed class
// name, emailAddress, isContacted

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProspectView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectView(filter: .uncontacted)
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
