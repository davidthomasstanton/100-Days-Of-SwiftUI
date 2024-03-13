//
//  Order.swift
//  CupcakeCorner_3
//
//  Created by David Stanton on 3/9/24.
//

import Foundation
import SwiftUI

@Observable
class Order: Codable {
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
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var totalCost: Decimal {
        var cost = Decimal(quantity * 2)
        if addExtraFrosting {
            cost += Decimal(quantity)
        }
        if addSprinkles {
            cost += Decimal(quantity / 2)
        }
        return cost
    }
}
