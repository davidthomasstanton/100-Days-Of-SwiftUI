//
//  Dice.swift
//  DiceRoll_1
//
//  Created by David Stanton on 5/10/24.
//

import Foundation
import SwiftData

@Model
class Dice_1 {
    var rollNum: Int
    var dieIncrement: Int
    var dieResult: Int
    
    init(rollNum: Int, dieIncrement: Int, dieResult: Int) {
        self.rollNum = rollNum
        self.dieIncrement = dieIncrement
        self.dieResult = dieResult
    }
    
    static var increment: Int = 100
    static let increments: [Int] = [4, 6, 8, 10, 12, 20, 100]
    
}
