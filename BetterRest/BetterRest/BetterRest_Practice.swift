//
//  BetterRest_Practice.swift
//  BetterRest
//
//  Created by David Stanton on 1/31/24.
//
import CoreML
import SwiftUI

struct BetterRest_Practice: View {
    // variables for wakeUp, sleepAmount, coffeeAmount
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    // variabes for alertTitle, alertMessage, showingAlert
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        Text("")
        NavigationStack {
            // NavigationStack with
            // Text: When do you want to wake up?
            // DatePicker "please enter a time"
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please pick a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                }
                
                // How much sleep do you want?
                // Stepper
                VStack(alignment: .leading, spacing: 0) {
                    Text("How much sleep do you want?")
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                // Daily Coffee intake
                // Stepper
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake:")
                    
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 0...20, step: 1)
                }
                
            }
            // toolbar for Calculate
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Ok") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    // generate model from SleepCaulculator
    // get hours & minutes from wakeup and convert to seconds
    // make prediction off of model
    // set alertTitle and message
    func calculateBedTime() -> Void {
        do {
            
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hours + minutes), estimatedSleep: Double(sleepAmount), coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is: "
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Something terrible has happened"
        }
        
        showingAlert = true
        
        
    }
   
        
   
}

#Preview {
    BetterRest_Practice()
}
