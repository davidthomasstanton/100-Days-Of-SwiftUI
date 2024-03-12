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
// name, streetAddress, city, zip
// computed property for hasValidAddress
// Computed property for cost
// $2 per cake, complicated cakes cost more,
// $1/cake for extra frosting, $0.50/cake for extra spinkles

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAdress"
        case _zip = "zip"
    }
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
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2
        if extraFrosting {
            cost += Decimal(quantity)
        }
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        return cost
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
}
