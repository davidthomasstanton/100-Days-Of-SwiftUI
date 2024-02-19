////
////  Practice_AddRemoveItems.swift
////  iExpense
////
////  Created by David Stanton on 2/14/24.
////
//
//import SwiftUI
//
//// Struct of a single expense
//// observe a class of an array of single expenses
//// with a didSet, encode the addition to a JSON file then save with a key
//// with a custom initializer, load the data then decode the JSON file
//// List that iterates through the expenses by name and displays them
//// toolbar button + that adds new expenses
//// function to remove items
//// .onDelete modifier to ForEach to remove items
//struct IExpense: Identifiable, Codable {
//    var id = UUID()
//    let name: String
//    let type: String
//    let amount: Double
//}
//
//@Observable
//class IExpenses {
//    var items = [IExpense]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([IExpense].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//        items = []
//    }
//}
//
//struct Practice_AddRemoveItems: View {
//    @State private var expenses = aExpenses()
//    @State private var showingAddExpense = false
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(expenses.items) { item in
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(item.name)
//                                .font(.headline)
//                            Text(item.type)
//                        }
//                        
//                        Spacer()
//                        
//                        Text(item.amount, format: .currency(code: "USD"))
//                    }
//                }
//                .onDelete(perform: deleteItem)
//            }
//            .navigationTitle("Expenses")
//            .toolbar {
//                Button("Add Item", systemImage: "plus") {
//                    showingAddExpense = true
//                }
//            }
//            .sheet(isPresented: $showingAddExpense) {
//                Practice_AddView(expenses: expenses)
//            }
//        }
//        
//    }
//    func deleteItem(at offset: IndexSet) {
//        expenses.items.remove(atOffsets: offset)
//    }
//
//}
//
//#Preview {
//    Practice_AddRemoveItems()
//}
