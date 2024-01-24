//
//  TimeConversion.swift
//  UnitConversion
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct TimeConversion: View {
    
    @State private var userInput = 0.0
    @State private var timeFrom = "seconds"
    @State private var timeTo = "minutes"
    @FocusState private var isFocused: Bool
    
    let times = ["seconds", "minutes", "hours", "days"]
    let timeConversion: [String: Double] = [
        "seconds": 1.0,
        "minutes": 0.0166666666667,
        "hours": 0.00027777833333,
        "days": 1.157409722208333465e-5
    ]
    
    var timeToSeconds: Double {
        return userInput * (1 / (timeConversion[timeFrom] ?? 1.0))
    }
    
    var timeFromSeconds: Double {
        return timeToSeconds * (timeConversion[timeTo] ?? 1.0)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Time From") {
                    TextField("Time From", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Unit", selection: $timeFrom) {
                        ForEach(times, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section("Time To") {
                    Text(timeFromSeconds, format: .number)
                    
                    Picker("Unit", selection: $timeTo) {
                        ForEach(times, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    TimeConversion()
}
