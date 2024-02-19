////
////  Practice_AddView2.swift
////  iExpense
////
////  Created by David Stanton on 2/15/24.
////
//
//import SwiftUI
//
//struct Practice_AddView2: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var name = ""
//    @State private var type = "Personal"
//    @State private var amount = 0.0
//    var expenses: aExpenses
//    let types = ["Personal", "Business"]
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                TextField("Name", text: $name)
//                Picker("Type", selection: $type) {
//                    ForEach(types, id: \.self) {
//                        Text($0)
//                    }
//                }
//                TextField("Amount", value: $amount, format: .currency(code: "USD"))
//                    .keyboardType(.decimalPad)
//            }
//            .navigationTitle("Add Expense")
//            .toolbar {
//                Button("Save Expense") {
//                    let item = ExpenseItem2(name: name, type: type, amount: amount)
//                    expenses.items.append(item)
//                    dismiss()
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    Practice_AddView2(expenses: Expenses2())
//}
