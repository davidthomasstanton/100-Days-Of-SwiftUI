//
//  Order.swift
//  CupcakeCorner_1
//
//  Created by David Stanton on 3/9/24.
//

import Foundation
// Order :: Observable class
// static types of Vanilla, Strawberry, Chocolate, Rainbow
// type, quantity, specialRequestEnabled, extraFrosting, addSprinkles
// specialRequestEnabled sets others to false if false

@Observable
class Order {
    static var types = ["Vanilla", "Chocolate", "Strawberry", "Rainbow"]
    
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
