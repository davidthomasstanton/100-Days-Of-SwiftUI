//
//  Practice_AddView.swift
//  iExpense
//
//  Created by David Stanton on 2/14/24.
//

// Form with defaults for name, type, and amount, and types
// @Environment protocol for dismissing 
// variable for IExpenses()

import SwiftUI

struct Practice_AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Personal", "Business"]
    var expenses = aExpenses()
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                Picker("Expense Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                TextField("Expense Amount", value: $amount, format: .currency(code: localCurrency))
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button("Save Expense") {
                    let itemToAdd = aExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(itemToAdd)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    Practice_AddView(expenses: aExpenses())
}
