//
//  BetterRest_Practice2.swift
//  BetterRest
//
//  Created by David Stanton on 2/1/24.
//
import CoreML
import SwiftUI

struct BetterRest_Practice2: View {
    // variables for wakeUp, sleepAmount, coffeeAmount
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0

    // variabes for alertTitle, alertMessage, showingAlert
    
    // computed property for default wakeup time
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    // computed property for calculating WakeTime
    // generate model from SleepCaulculator
    // get hours & minutes from wakeup and convert to seconds
    // make prediction off of model
    // set alertTitle and message
    var wakeTime: String {
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
            return "There has been a terrible error"
        }
    }
    
    var body: some View {
        // NavigationStack with...
        NavigationStack {
            Form {
                
                // Text: When do you want to wake up?
                // DatePicker "please enter a time"
                Section {
                    DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        //.labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                }
                
                // How much sleep do you want?
                // Stepper
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    } header: {
                    Text("How much sleep do you want?")
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
                }
                // toolbar for Calculate
             
                Text(wakeTime)
                    .font(.headline)
            }
        }
        .navigationTitle("BetterRest")
    }
}

#Preview {
    BetterRest_Practice2()
}
