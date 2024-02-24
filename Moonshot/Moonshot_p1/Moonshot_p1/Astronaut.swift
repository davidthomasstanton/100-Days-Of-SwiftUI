//
//  Astronaut.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/22/24.
//

import Foundation
// struct for Astronaut that has id, name, and description
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

struct CrewMember {
    let astronaut: Astronaut
    let role: String
}
