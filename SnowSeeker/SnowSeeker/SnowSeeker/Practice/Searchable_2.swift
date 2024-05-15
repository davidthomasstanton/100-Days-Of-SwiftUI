//
//  Searchable_2.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

struct Searchable_2: View {
    @State private var searchText = ""
    let allNames = ["Matt", "Michael", "Bordy", "Andrew", "Erik"]
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { name in
                name.localizedStandardContains(searchText)
            }
        }
    }
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Search for a name")
            .navigationTitle("Search")
        }
    }
}

#Preview {
    Searchable_2()
}
