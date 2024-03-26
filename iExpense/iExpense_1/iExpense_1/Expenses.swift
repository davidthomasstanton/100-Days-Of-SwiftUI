//
//  Expenses.swift
//  iExpense_1
//
//  Created by David Stanton on 3/25/24.
//
// ==== Expenses ====
// class that is observable
// var: items that encodes as a JSON and set in UserDefaults with a key
// var: personalItems, businessItems that filters from items
// init that gets data for items from UserDefaults or sets empty array
// observe a class of an array of single expenses
import Foundation

@Observable
class Expenses {
    var items: [ExpenseItem] {
        didSet {
            let encoded = try? JSONEncoder().encode(items)
            UserDefaults.standard.set(encoded, forKey: "Items")
        }
    }
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
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
