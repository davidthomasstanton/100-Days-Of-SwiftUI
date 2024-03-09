//
//  Order.swift
//  CupcakeCorner_3
//
//  Created by David Stanton on 3/9/24.
//

import Foundation
import SwiftUI

@Observable
class Order {
    static var types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    var type = 0
    var quantity = 3
    var extraAdditions = false {
        didSet {
            if extraAdditions == false {
                addExtraFrosting = false
                addSprinkles = false
            }
        }
    }
    var addExtraFrosting = false
    var addSprinkles = false
    
}
