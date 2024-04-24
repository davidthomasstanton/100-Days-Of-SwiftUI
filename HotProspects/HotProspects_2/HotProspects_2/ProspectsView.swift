//
//  ProspectsView.swift
//  HotProspects_2
//
//  Created by David Stanton on 4/23/24.
//
import SwiftData
import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted"
        case .uncontacted:
            "Uncontacted"
        }
    }
    
    var body: some View {
        NavigationStack {
            Text("Prospects: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Add Prospect", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Thom Yorke", email: "th@radiohead.net", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
