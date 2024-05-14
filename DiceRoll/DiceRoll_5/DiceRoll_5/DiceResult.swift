//
//  DiceResult.swift
//  DiceRoll_5
//
//  Created by David Stanton on 5/13/24.
//

import Foundation

struct DiceResult: Codable, Hashable, Identifiable {
    var id = UUID()
    var number: Int
    var type: Int
    var rolls = [Int]()
    var description: String {
        rolls.map(String.init).joined(separator: ", ")
    }
    init(number: Int, type: Int) {
        self.number = number
        self.type = type
        
        for _ in 0..<number {
            let roll = Int.random(in: 1...type)
            rolls.append(roll)
        }
    }
}
