//
//  ExpenseView.swift
//  iExpense_1
//
//  Created by David Stanton on 3/25/24.
//
// ==== ExpenseSection ====
// constants for expenses, title, deleteItems, localCurrency
// Section with a ForEach that displays all expenses: name, type, currency
// .onDelete will perform removefunction for item type
import SwiftUI

struct ExpenseView: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.name)
                        Text(expense.type)
                    }
                    Spacer()
                    Text(expense.amount, format: .currency(code: localCurrency))
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseView(title: "Personal", expenses: []) { _ in }
}
