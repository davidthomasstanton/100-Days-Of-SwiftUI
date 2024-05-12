//
//  DiceResult.swift
//  DiceRoll_3
//
//  Created by David Stanton on 5/11/24.
//

import Foundation

struct DiceResult: Codable, Identifiable {
    let id = UUID()
    var type: Int
    var number: Int
    var rolls = [Int]()
    
    init(type: Int, number: Int) {
        self.type = type
        self.number = number
        
        for _ in 0..<number {
            let roll = Int.random(in: 1...type)
            rolls.append(roll)
        }
    }
}
