//
//  DiceResult.swift
//  DiceRoll_4
//
//  Created by David Stanton on 5/11/24.
//

import Foundation

struct DiceResult: Codable, Identifiable {
    var id = UUID()
    var number: Int
    var type: Int
    var rolls = [Int]()
    
    init(number: Int, type: Int) {
        self.number = number
        self.type = type
        
        for _ in 0..<number {
            let roll = Int.random(in: 1...type)
            rolls.append(roll)
        }
    }
}
