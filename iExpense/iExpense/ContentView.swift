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
struct ExpenseItem: Identifiable, Codable {
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
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.subheadline)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: localCurrency))
                            //.font(item.amount > 100 ? .headline : .subheadline)
                            
                    }
                }
                .onDelete(perform: deleteExpense)
            }
            .navigationTitle("Expenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func deleteExpense(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
