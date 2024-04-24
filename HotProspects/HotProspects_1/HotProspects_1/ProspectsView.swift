//
//  ProspectsView.swift
//  HotProspects_1
//
//  Created by David Stanton on 4/23/24.
//
import SwiftData
import SwiftUI

struct ProspectsView: View {
    enum FilterTypes {
        case none, contacted, uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    
    let filter: FilterTypes
    
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
            Text("Contacts: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Add prospect", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Paul Hudson", email: "paul@hackingwithswift.com", isContacted: false)
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
