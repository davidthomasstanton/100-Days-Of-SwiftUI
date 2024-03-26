//
//  ExpenseItem.swift
//  iExpense_2
//
//  Created by David Stanton on 3/25/24.
//
// ==== ExpenseItem ====
// struct that is Identifiable, Codable, Equatable
// var: id, name, type, amount
import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Decimal
}
