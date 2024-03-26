//
//  ContentView.swift
//  iExpense_1
//
//  Created by David Stanton on 3/25/24.
//
// ==== ContentView ====
// var: expenses, showingAddExpense
// NavStack with a List that iterates through the expenses by name and displays them
// toolbar button + that goes to navlink AddView passing in expenses
// functions to remove items at index
// removeItems, removePersonalItems, removeBusinessItems

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseView(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                ExpenseView(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    // func removeItems()
    // create blank IndexSet of objects to delete
    // iterate through offsets, assign the offset of the inputArray to an item
    // find the first index of that item in the general expenses array
    // if it's there, add it to the blank Index
    // remove all the items from the objects to delete IndexSet
    func removeItems(at offsets: IndexSet, in itemArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        for offset in offsets {
            let item = itemArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
}

#Preview {
    ContentView()
}
