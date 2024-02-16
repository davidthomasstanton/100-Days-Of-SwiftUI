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
    var expenses: IExpenses
    
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
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button("Save Expense") {
                    let item = IExpense(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    Practice_AddView(expenses: IExpenses())
}
