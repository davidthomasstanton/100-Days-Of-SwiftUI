//
//  ContentView.swift
//  iExpense
//
//  Created by David Stanton on 2/12/24.
//

import SwiftUI
import Observation

// Struct of a single expense
// observe a class of an array of single expenses
// with a didSet, encode the addition to a JSON file then save with a key
// with a custom initializer, load the data then decode the JSON file
// List that iterates through the expenses by name and displays them
// toolbar button + that adds new expenses
// function to remove items
// .onDelete modifier to ForEach to remove items
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
