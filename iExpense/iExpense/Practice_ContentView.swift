//
//  Practice_ContentView.swift
//  iExpense
//
//  Created by David Stanton on 2/15/24.
//

import SwiftUI
// Struct of a single expense
// observe a class of an array of single expenses
// with a didSet, encode the addition to a JSON file then save with a key
// with a custom initializer, load the data then decode the JSON file
// List that iterates through the expenses by name and displays them
// toolbar button + that adds new expenses
// function to remove items
// .onDelete modifier to ForEach to remove items
struct aExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class aExpenses {
    var items = [aExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([aExpenseItem].self, from: savedItems) {
                items = decoded
                return
            }
        }
        items = []
    }
}

struct Practice_ContentView: View {
    @State private var expenses = aExpenses()
    @State private var showingAddExpense = false
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
                            .styleAmount(for: item)
                    }
                }
            }
            .navigationTitle("Expenses Practice")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                Practice_AddView(expenses: expenses)
            }
        }
    }
    
}

extension View {
    func styleAmount(for item: aExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
#Preview {
    Practice_ContentView()
}
