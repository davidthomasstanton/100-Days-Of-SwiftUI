//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by David Stanton on 4/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 10
    var body: some View {
        VStack {
            Text("value: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement"){
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("not handled")
            }
        }
    }
}

#Preview {
    ContentView()
}
