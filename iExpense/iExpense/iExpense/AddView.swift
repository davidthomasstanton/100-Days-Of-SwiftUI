//
//  AddView.swift
//  iExpense
//
//  Created by David Stanton on 2/14/24.
//

import SwiftUI
// ==== AddView ====
// Environment tag to dismiss sheet
// var: expenses, name, type, amount, types [Personal, Business], localCurrency
// NavStack with a form for adding new expenses
// toolbar with toolbaritems for save and cancel
// have a variable for expenses and types
// include a button on the toolbar to add item

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var expenses: Expenses
    @State private var name = "New Expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Personal", "Business"]
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
