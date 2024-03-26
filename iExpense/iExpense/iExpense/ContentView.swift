//
//  ContentView.swift
//  iExpense
//
//  Created by David Stanton on 2/12/24.
//

import SwiftUI
import Observation

// ==== ExpenseItem ====
// struct that is Identifiable, Codable, Equatable
// var: id, name, type, amount
// ==== Expenses ====
// class that is observable
// var: items that encodes as a JSON and set in UserDefaults with a key
// var: personalItems, businessItems that filters from items
// init that gets data for items from UserDefaults or sets empty array
// ==== ContentView ====
// var: expenses, showingAddExpense
// NavStack with a List that iterates through the expenses by name and displays them
// toolbar button + that goes to navlink AddView passing in expenses
// functions to remove items at index
// removeItems, removePersonalItems, removeBusinessItems
// func removeItems()
// create blank IndexSet of objects to delete
// iterate through offsets, assign the offset of the inputArray to an item
// find the first index of that item in the general expenses array
// if it's there, add it to the blank Index
// remove all the items from the objects to delete IndexSet
// ==== ExpenseSection ====
// constants for title, expenses, deleteItems, localCurrency
// Section with a ForEach that displays all expenses: name, type, currency
// .onDelete will perform removefunction for item type
// ==== AddView ====
// Environment tag to dismiss sheet
// var: expenses, name, type, amount, types [Personal, Business], localCurrency
// NavStack with a form for adding new expenses
// toolbar with toolbaritems for save and cancel
// have a variable for expenses and types
// include a button on the toolbar to add item
struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
//    var personalItems: [ExpenseItem] {
//        items.filter { $0.type == "Personal" }
//    }
//    
//    var businessItems: [ExpenseItem] {
//        items.filter { $0.type == "Business" }
//    }
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decoded
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @State private var showingAddExpense = false
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
            }
            .navigationTitle("Expenses")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
//                Button("Add Expense", systemImage: "plus") {
//                    showingAddExpense = true
//                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    // func removeItems
    // create blank IndexSet of objects to delete
    // iterate through offsets, assign the offset of the inputArray to an item
    // find the first index of that item in the general expenses array
    // if it's there, add it to the blank Index
    // remove all the items from the objects to delete IndexSet
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
//        expenses.items.remove(atOffsets: offsets)
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

#Preview {
    ContentView()
}
