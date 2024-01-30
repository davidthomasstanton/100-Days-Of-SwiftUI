//
//  ContentView.swift
//  BetterRest
//
//  Created by David Stanton on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
                    .labelsHidden()
                
                DatePicker("Please enter a date", selection: $wakeUp)
                
                Text(Date.now.formatted(date: .long, time: .shortened))
            }
            .padding()
        }
    }
    
    func exampleDates() {
        /*
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
         */
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minutes = components.minute ?? 0
    }
}

#Preview {
    ContentView()
}
