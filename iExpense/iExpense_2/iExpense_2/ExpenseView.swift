//
//  ExpenseView.swift
//  iExpense_2
//
//  Created by David Stanton on 3/25/24.
//
// ==== ExpenseSection ====
// constants for title, expenses, deleteItems, localCurrency
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
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.type)
                    }
                    Spacer()
                    Text(item.amount, format: .currency(code: localCurrency))
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseView(title: "Personal", expenses: []) { _ in }
}
