//
//  Practice_AddRemoveItems.swift
//  iExpense
//
//  Created by David Stanton on 2/14/24.
//

import SwiftUI

// Struct of a single expense
// observe a class of an array of single expenses
// List that iterates through the expenses by name and displays them
// toolbar button + that adds new expenses
// function to remove items
// .onDelete modifier to ForEach to remove items
struct IExpense: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class IExpenses {
    var items = [IExpense]()
}

struct Practice_AddRemoveItems: View {
    @State private var expenses = IExpenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Expenses")
            .toolbar {
                Button("Add Item", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                Practice_AddView(expenses: expenses)
            }
        }
        
    }
    func deleteItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }

}

#Preview {
    Practice_AddRemoveItems()
}
