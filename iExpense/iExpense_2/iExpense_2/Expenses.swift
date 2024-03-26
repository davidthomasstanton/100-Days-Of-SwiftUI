//
//  Expenses.swift
//  iExpense_2
//
//  Created by David Stanton on 3/25/24.
//
// ==== Expenses ====
// class that is observable
// var: items that encodes as a JSON and set in UserDefaults with a key
// var: personalItems, businessItems that filters from items
// init that gets data for items from UserDefaults or sets empty array
import Foundation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
                items = decoded
                return
            }
        }
        items = []
    }
}
