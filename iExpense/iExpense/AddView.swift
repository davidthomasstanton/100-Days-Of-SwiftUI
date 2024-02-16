//
//  AddView.swift
//  iExpense
//
//  Created by David Stanton on 2/14/24.
//

import SwiftUI

// Environment tag to dismiss sheet
// display name, type, amount
// have a variable for expenses and types
// include a button on the toolbar to add item

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expenses: Expenses
    var types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name of Expense", text: $name)
                Picker("Type of Expense", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                TextField("Amount of Expense", value: $amount, format: .currency(code: "USD"))
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button("Save Expense") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
