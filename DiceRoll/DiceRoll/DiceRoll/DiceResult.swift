//
//  DiceResult.swift
//  DiceRoll
//
//  Created by David Stanton on 5/11/24.
//
// struct for DiceResult that's Codable and Identifiable
// id, type, number rolls
// initializer for type and number and for appending random rolls
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
