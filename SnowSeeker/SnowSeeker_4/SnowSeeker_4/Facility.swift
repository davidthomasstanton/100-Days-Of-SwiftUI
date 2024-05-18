//
//  Facility.swift
//  SnowSeeker_4
//
//  Created by David Stanton on 5/17/24.
//

import Foundation
import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String
    
    private let icons = [
        "Accommodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circlepath",
        "Family": "person.3"
    ]
    
    private let descriptions = [
        "Accommodation": "This resort has popular on-site accomodations.",
        "Beginners": "This resort has lots of ski schools.",
        "Cross-country": "This resort has many cross-country ski routes.",
        "Eco-friendly": "This resort ha won an award for environment friendliness.",
        "Family": "This resort is popular with families."
    ]
    
    var icon: some View {
        if let iconName = icons[name] {
            Image(systemName: iconName)
                .foregroundStyle(.secondary)
        } else {
            fatalError("Could not find facility type.")
        }
    }
    
    var description: String {
        if let message = descriptions[name] {
            message
        } else {
            fatalError("Could not find facility type.")
        }
    }
}
