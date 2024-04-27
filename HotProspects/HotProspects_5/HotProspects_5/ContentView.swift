//
//  ContentView.swift
//  HotProspects_5
//
//  Created by David Stanton on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProspectView(filter: .none)
                .tabItem { Label("Everyone", systemImage: "person.3") }
            ProspectView(filter: .contacted)
                .tabItem { Label("Contacted", systemImage: "checkmark.circle") }
            ProspectView(filter: .uncontacted)
                .tabItem { Label("Uncontacted", systemImage: "questionmark.diamond") }
            MeView()
                .tabItem { Label("Me", systemImage: "person.crop.square") }
        }
    }
}

#Preview {
    ContentView()
}
