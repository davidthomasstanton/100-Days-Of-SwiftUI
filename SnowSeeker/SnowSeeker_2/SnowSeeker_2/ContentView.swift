//
//  ContentView.swift
//  SnowSeeker_2
//
//  Created by David Stanton on 5/15/24.
//

import SwiftUI

enum SortOrder {
    case `default`, alphabetical, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var favorites = Favorites()
    @State private var searchText = ""
    @State private var sortOrder = SortOrder.default
    @State private var showingSortOrder = false
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            resorts
        } else {
            resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var sortedResorts: [Resort] {
        switch sortOrder {
        case .default:
            filteredResorts
        case .alphabetical:
            filteredResorts.sorted { $0.name < $1.name }
        case .country:
            filteredResorts.sorted { $0.country < $1.country }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(sortedResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            }
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        if favorites.contains(resort) {
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort.")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .navigationTitle("SnowSeeker_2")
            .searchable(text: $searchText, prompt: "Search for a result")
            .toolbar {
                Button("Sort", systemImage: "arrow.up.arrow.down") {
                    showingSortOrder = true
                }
            }
            .confirmationDialog("Sort Resorts", isPresented: $showingSortOrder) {
                Button("Default") { sortOrder = .default }
                Button("By Name") { sortOrder = .alphabetical }
                Button("By Country") { sortOrder = .country }
            }
            
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
