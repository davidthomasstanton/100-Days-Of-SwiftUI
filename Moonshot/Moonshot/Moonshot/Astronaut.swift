//
//  Astronaut.swift
//  Moonshot
//
//  Created by David Stanton on 2/20/24.
//

import Foundation

// struct for Astronaut that has id, name, and description
struct Astronaut: Codable, Identifiable {
    let id: String
    var name: String
    var description: String
}
