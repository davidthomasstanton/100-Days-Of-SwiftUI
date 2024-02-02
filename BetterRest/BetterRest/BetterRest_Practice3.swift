//
//  BetterRest_Practice3.swift
//  BetterRest
//
//  Created by David Stanton on 2/1/24.
//
import CoreML
import SwiftUI

struct BetterRest_Practice3: View {
    // variables for wakeUp, sleepAmount, coffeeAmount
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount: Double = 8.0
    @State private var coffeeAmount: Int = 0
    
    // computed property for default wakeup time
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    // computed property for calculating bedTime
    // generate model from SleepCaulculator
    // get hours & minutes from wakeup and convert to seconds
    // make prediction off of model
    var bedTime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hours + minutes), estimatedSleep: Double(sleepAmount), coffee: Int64(coffeeAmount))
            
            let bedTime = wakeUp - prediction.actualSleep
            
            return "Your ideal bedtime is " + bedTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "There has been an error"
        }
    }

 
    var body: some View {
        // NavigationStack with...
        NavigationStack {
            Form {
                // Text: When do you want to wake up?
                // DatePicker "please enter a time"
                Section {
                    DatePicker("Time: ", selection: $wakeUp, displayedComponents: .hourAndMinute)
                } header: {
                    Text("When do you want to wake up?")
                        .sectionHeaderStyle()
                }
                
                // How much sleep do you want?
                // Stepper
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, step: 0.25)
                } header: {
                    Text("How much sleep do you want?")
                        .sectionHeaderStyle()
                }
                
                // Daily Coffee intake
                // Stepper
                Section {
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .sectionHeaderStyle()
                }
                
                Text(bedTime)
            }
            .navigationTitle("BetterRest")
        }
    }
}

struct sectionHeader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .italic()
    }
}

extension View {
    func sectionHeaderStyle() -> some View {
        modifier(sectionHeader())
    }
}


#Preview {
    BetterRest_Practice3()
}
