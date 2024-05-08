//
//  Card.swift
//  Flashzilla_4
//
//  Created by David Stanton on 5/7/24.
//

import Foundation

struct Card: Codable, Equatable, Hashable, Identifiable {
    var id: UUID
    var prompt: String
    var answer: String
    static let example = Card(id: UUID(), prompt: "What is the capital of Alaska?", answer: "Juneau, don't you?")
}
