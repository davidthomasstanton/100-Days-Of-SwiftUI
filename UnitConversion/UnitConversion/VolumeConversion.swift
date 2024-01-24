//
//  VolumeConversion.swift
//  UnitConversion
//
//  Created by David Stanton on 1/23/24.
//

import SwiftUI

struct VolumeConversion: View {
    @State private var userVolume = 1.0
    @State private var unitFrom: String = "milliliters"
    @State private var unitTo: String = "milliliters"
    let volumes = ["milliliters", "liters", "cups", "pints", "gallons"]
    let milliliterConversion: [String: Double] = [
        "milliliters": 1.0,
        "liters": 0.001,
        "pints": 0.00211337810957,
        "cups": 0.00416667,
        "gallons": 0.00026417226369625002079
    ]
    
    var convertToMilliliters: Double {
        return userVolume * (1 / (milliliterConversion[unitFrom] ?? 1.0))
        
    }
    
    /*
    var userVolumeMilliliters: Double {
        switch unitFrom {
        case "milliliters":
            return userVolume
        case "liters":
            return userVolume * 0.001
        case "pints":
            return userVolume * 0.00211337810957
        case "cups":
            return userVolume * 0.00416667
        case "gallons":
            return userVolume * 0.00026417226369625002079
        default:
            return userVolume
        }
    }
     */
    
    var convertedVolume: Double {
        return convertToMilliliters * (milliliterConversion[unitTo] ?? 1.0)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter Volume") {
                    TextField("Volume Amount", value: $userVolume, format: .number)
                    
                    Picker("Base Unit", selection: $unitFrom) {
                        ForEach(volumes, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    //.pickerStyle(.segmented)
                }
                
                Section("Conversion") {
                    Text(convertedVolume, format: .number)
                    Picker("Conversion Unit", selection: $unitTo) {
                        ForEach(volumes, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    //.pickerStyle(.segmented)
                }
            }
            .navigationTitle("Volume Conversision")
        }
    }
}

#Preview {
    VolumeConversion()
}
