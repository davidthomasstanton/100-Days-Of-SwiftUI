//
//  AddView.swift
//  iExpense_1
//
//  Created by David Stanton on 3/25/24.
//
// ==== AddView ====
// Environment tag to dismiss sheet
// var: expenses, name, type, amount, types [Personal, Business], localCurrency
// NavStack with a form for adding new expenses
// toolbar with toolbaritems for save and cancel
// have a variable for expenses and types
// include a button on the toolbar to add item
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var expenses = Expenses()
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Decimal = 0.0
    let types = ["Personal", "Business"]
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name...", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "plus") {
                        let newExpense = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(newExpense)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) { 
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView()
}
