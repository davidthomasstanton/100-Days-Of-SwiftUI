//
//  Card.swift
//  Flashzilla_1
//
//  Created by David Stanton on 5/1/24.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
