//
//  ExpenseItem.swift
//  iExpense_4
//
//  Created by David Stanton on 3/26/24.
//
// ==== ExpenseItem ====
// class with name, type, amount

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var name: String
    var type: String
    var amount: Decimal
    static let localCurrency = Locale.current.currency?.identifier ?? "USD"
    static let types = ["Personal", "Business"]
    
    init(name: String, type: String, amount: Decimal) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
