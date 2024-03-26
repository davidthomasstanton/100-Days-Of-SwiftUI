//
//  ExpenseSection.swift
//  iExpense
//
//  Created by David Stanton on 2/19/24.
//
// ==== ExpenseSection ====
// constants for title, expenses, deleteItems, localCurrency
// Section with a ForEach that displays all expenses: name, type, currency
// 
import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.subheadline)
                        }
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: localCurrency))
                            .style(for: item)
                        //.font(item.amount > 100 ? .headline : .subheadline)
                        
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseSection(title: "Personal", expenses: []) { _ in }
}
