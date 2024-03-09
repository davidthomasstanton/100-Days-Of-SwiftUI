//
//  Order.swift
//  CupcakeCorner_2
//
//  Created by David Stanton on 3/9/24.
//
// Order :: Observable class
// static types of Vanilla, Strawberry, Chocolate, Rainbow
// type, quantity, specialRequestEnabled, extraFrosting, addSprinkles
// specialRequestEnabled sets others to false if false
import Foundation
import SwiftUI

@Observable
class Order {
    static var types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
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
