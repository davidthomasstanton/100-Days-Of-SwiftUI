//
//  Practice_AddView.swift
//  iExpense
//
//  Created by David Stanton on 2/14/24.
//

// Form with name, type, and amount, and types
// variable for IExpenses()

import SwiftUI

struct Practice_AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Business", "Personal"]
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
        }
    }
}

#Preview {
    Practice_AddView(expenses: IExpenses())
}
