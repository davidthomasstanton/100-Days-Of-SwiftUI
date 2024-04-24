//
//  ProspectView.swift
//  HotProspects_3
//
//  Created by David Stanton on 4/23/24.
//
import SwiftData
import SwiftUI

struct ProspectView: View {
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
            Text("Prospects: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Add Prospect", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Thom York", email: "ty@radiohead.gov", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
        }
    }
}

#Preview {
    ProspectView(filter: .none)
        .modelContainer(for: Prospect.self)
}
