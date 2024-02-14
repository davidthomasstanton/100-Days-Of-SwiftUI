//
//  ContentView.swift
//  iExpense
//
//  Created by David Stanton on 2/12/24.
//

import SwiftUI
import Observation

// create an Expenses class that will be attached to our list using @State
// name of item, business or personal, cost (as a Double)
struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("iExpense")
        }
    }
}

#Preview {
    ContentView()
}
