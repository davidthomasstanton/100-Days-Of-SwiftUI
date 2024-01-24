//
//  TemperatureConversion.swift
//  UnitConversion
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct TemperatureConversion: View {
    @State private var userInput = 0.0
    @State private var tempFrom = "Celsius"
    @State private var tempTo = "Farhenheit"
    let temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    @FocusState private var isFocused: Bool
    
    
    var tempConverted: Double{
        switch (tempFrom, tempTo) {
        case ("Celsius", "Fahrenheit"):
            return userInput * (9/5) + 32
        case ("Celsius", "Kelvin"):
            return userInput + 273.15
        case ("Fahrenheit", "Celsius"):
            return ((userInput - 32) * (5/9))
        case ("Fahrenheit", "Kelvin"):
            return ((userInput - 32) * (5/9) + 273.15)
        case ("Kelvin", "Celsius"):
            return userInput - 273.15
        case ("Kelvin", "Fahrenheit"):
            return ((userInput - 273.15) * (9/5) + 32)
        default:
            return userInput
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    TextField("Enter temperature" + "°", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        
                    Picker("Temperature From", selection: $tempFrom) {
                        ForEach(temperatures, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To") {
                    Text(tempConverted.formatted() + "°")
                    Picker("Temperature To", selection: $tempTo) {
                        ForEach(temperatures, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Temperature Conversion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            
        }
        
        
        
    }
}

#Preview {
    TemperatureConversion()
}
