//
//  Practice_Mission.swift
//  Moonshot
//
//  Created by David Stanton on 2/20/24.
//

import Foundation

// Struct Mission
// nested struct CrewRole has name & role
// Mission contains id, launchDate, crew (of CrewRole), description
// computed properties for displayName, image, and...
// formattedLaunchDate that sends an optional "N/A"
struct Mission2: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
