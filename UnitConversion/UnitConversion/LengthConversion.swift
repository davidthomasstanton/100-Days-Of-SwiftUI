//
//  LengthConversion.swift
//  UnitConversion
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct LengthConversion: View {
    
    @State private var userInput = 0.0
    @State private var lengthFrom = "feet"
    @State private var lengthTo = "meters"
    @FocusState private var isFocued: Bool
    let lengths = ["meters", "kilometers", "feet", "yards", "miles"]
    let lengthConversion: [String: Double] = [
        "meters": 0.3048,
        "kilometers": 0.0003048,
        "feet": 1.0,
        "yards": 0.333333,
        "miles": 0.00018939375
    ]
    
    var convertToFeet: Double {
        return userInput * (1 / (lengthConversion[lengthFrom] ?? 1.0))
    }
    
    var convertFromFeet: Double {
        return convertToFeet * (lengthConversion[lengthTo] ?? 1.0)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert From") {
                    TextField("Length From", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocued)
                    
                    Picker("Unit", selection: $lengthFrom) {
                        ForEach(lengths, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    //.pickerStyle(.segmented)
                }
                
                Section("Convert To") {
                    Text(convertFromFeet.formatted())
                    
                    Picker("Unit", selection: $lengthTo) {
                        ForEach(lengths, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                }
            }
            .navigationTitle("Length Conversion")
        }
    }
}

#Preview {
    LengthConversion()
}
