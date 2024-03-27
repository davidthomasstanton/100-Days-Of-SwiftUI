//
//  ContentView.swift
//  iExpense_4
//
//  Created by David Stanton on 3/26/24.
//
// ==== ContentView ====
// var: showingAddExpense, expenseType, sortOrder = [name, amount]
// NavStack with ExpenseView
// toolbar button to add expense, pulling up AddView sheet
// Menu to filter expenses by type: All | Personal / Business
// Menu to sort expenses by name / name.reverse / amount.low to high / amount.high to low
import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @State private var expenseType = "All"
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    var body: some View {
        NavigationStack {
            ExpenseView(type: expenseType, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Save", systemImage: "plus") {
                            showingAddExpense.toggle()
                        }
                    }
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                            Picker("Filter", selection: $expenseType) {
                                Text("Show All")
                                    .tag("All")
                                
                                Divider()
                                
                                ForEach(ExpenseItem.types, id: \.self) { type in
                                    Text(type)
                                        .tag(type)
                                }
                            }
                        }
                        
                        
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Name (A-Z)")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.name),
                                        SortDescriptor(\ExpenseItem.amount)
                                    ])
                                Text("Name (Z-A)")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.name, order: .reverse),
                                        SortDescriptor(\ExpenseItem.amount)
                                    ])
                                Text("Amount (low to high)")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.amount),
                                        SortDescriptor(\ExpenseItem.name)
                                    ])
                                Text("Amount (hight to low")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                        SortDescriptor(\ExpenseItem.name)
                                    ])

                            }
                        }
                    }
                    
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView()
                }
        }
    }
}

#Preview {
    ContentView()
}
