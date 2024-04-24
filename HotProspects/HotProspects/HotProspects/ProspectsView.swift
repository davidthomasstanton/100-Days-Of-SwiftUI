//
//  ProspectsView.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//
// ProspectsView
// enum for FilterType (none, contacted, uncontacted)
// set a filter and a title that switches by the filter
// Query variable that sorts by name "prospects"
// In a NavStack, Text of "People: #of people"
// toolbar with a button "qrcode.viewfinder" to add a prospect
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
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    var body: some View {
        NavigationStack {
            Text("People: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Paul Hudson", emailAddress: "paul@hackingwithswift.com", isContacted: false)
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
