//
//  WeSplitPickerPractice.swift
//  WeSplit2
//
//  Created by David Stanton on 1/23/24.
//

import SwiftUI

struct WeSplitPickerPractice: View {
    // Variables for checkAmount, numberOfPeople, tipPercentage, tipPercentages
    // variable for amountIsFocused
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    @FocusState private var amountIsFocused: Bool
    
    // Computed property for amountPerPerson
    var amountPerPerson: Double {
        let tipTotal = checkAmount * 0.01 * Double(tipPercentage)
        let grandTotal = checkAmount + tipTotal
        return grandTotal / Double(numberOfPeople)
    }
    
    var body: some View {
        // Navigation Stack with a Form and 3 sections, includes a Done button for keyboard
        NavigationStack {
            Form {
                //Section with text field for Check Amount and a Picker for number of people
                Section("Check Amount") {
                    TextField("Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(0..<100) {
                            Text("\($0)")
                        }
                    }
                    //.pickerStyle(.navigationLink)
                }
                // Section with tip percentage in a segmented row
                Section("Tip Percentage") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // Section that displays the amount per person
                Section("Amount Per Person") {
                    Text(amountPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }
            .navigationTitle("WeSplit Practice #2")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    WeSplitPickerPractice()
}
