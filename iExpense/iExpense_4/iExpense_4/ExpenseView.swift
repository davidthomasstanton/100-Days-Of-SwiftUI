//
//  ExpenseView.swift
//  iExpense_4
//
//  Created by David Stanton on 3/26/24.
//
// ==== ExpenseSection ====
// modelContainer, expenses, localCurrency
// List that iterates through all expenses, showing name/type/amount (in local currency)
// init with type (defaulted to "All") and sortOrder of ExpenseItem
// create a query with a filter of #Predicate type: if "All" else return the type
// .onDelete will perform removefunction for item
import SwiftData
import SwiftUI

struct ExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [ExpenseItem]
    
    var body: some View {
        List {
            ForEach(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.name)
                        Text(expense.type)
                    }
                    Spacer()
                    Text(expense.amount, format: .currency(code: ExpenseItem.localCurrency))
                }
            }
        }
    }
    
    init(type: String = "All", sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate {
            if type == "All" {
                return true
            } else {
                return $0.type == type
            }
        }, sort: sortOrder)
        
    }
}

#Preview {
    ExpenseView(sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
