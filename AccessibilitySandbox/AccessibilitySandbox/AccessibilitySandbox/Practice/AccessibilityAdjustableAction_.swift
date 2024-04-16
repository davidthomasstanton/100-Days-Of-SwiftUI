//
//  AccessibilityAdjustableAction_.swift
//  AccessibilitySandbox
//
//  Created by David Stanton on 4/15/24.
//

import SwiftUI

struct AccessibilityAdjustableAction_: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
                .padding()
            Button("Increment") {
                value += 1
            }
            .padding()
            
            Button("Decrement") {
                value -= 1
            }
            .padding()
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
                print("Not handled")
            }
        }
    }
}

#Preview {
    AccessibilityAdjustableAction_()
}
