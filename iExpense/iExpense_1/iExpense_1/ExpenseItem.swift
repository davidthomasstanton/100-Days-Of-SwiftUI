//
//  ExpenseItem.swift
//  iExpense_1
//
//  Created by David Stanton on 3/25/24.
//
// ==== ExpenseItem ====
// struct that is Identifiable, Codable, Equatable
// var: id, name, type, amount
import Foundation

struct ExpenseItem: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Decimal
}
