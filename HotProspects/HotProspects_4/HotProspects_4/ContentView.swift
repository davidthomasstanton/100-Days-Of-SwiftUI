//
//  ContentView.swift
//  HotProspects_4
//
//  Created by David Stanton on 4/25/24.
//
// Everyone "person.3", Contacted, "checkmark.circle", Uncontacted "questionmark.diamond"
// Me, "person.crop.square"
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
