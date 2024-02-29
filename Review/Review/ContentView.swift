//
//  ContentView.swift
//  Review
//
//  Created by David Stanton on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var animationAmount = 1.0
    var body: some View {
        VStack {
//            Stepper("Sleep: \(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.5)
//            
//            Text(exampleDate(), format: .dateTime)
//            
//            List(0..<5) {
//                Text("Dynamic row \($0)")
//            }
            Stepper("Scale Amount \(animationAmount.formatted())", value: $animationAmount.animation(), in: 0...5, step: 0.5)
            Button("Tap Me") {
                
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
//            .overlay(
//                Circle()
//                    .stroke(.gray)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(
//                        .easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false), value: animationAmount
//                    )
//            )
//            .onAppear {
//                animationAmount = 2
//            }
            
            
        }
    }
    
    func exampleDate() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        return date
    }
}

#Preview {
    ContentView()
}
