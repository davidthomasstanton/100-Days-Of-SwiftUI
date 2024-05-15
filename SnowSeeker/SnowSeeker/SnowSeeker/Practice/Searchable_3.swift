//
//  Searchable_3.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

struct Searchable_3: View {
    let allNames = ["Matt", "Michael", "Bordy", "Andrew", "Erik"]
    @State private var searchText = ""
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
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search for name")
        }
    }
}

#Preview {
    Searchable_3()
}
