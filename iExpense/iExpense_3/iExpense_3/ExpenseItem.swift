//
//  Expenses.swift
//  iExpense_3
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
    
    init(name: String, type: String, amount: Decimal) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
