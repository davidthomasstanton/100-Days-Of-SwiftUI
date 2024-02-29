//
//  StepperView.swift
//  Review
//
//  Created by David Stanton on 2/28/24.
//

import SwiftUI

struct StepperView: View {
    @State private var value: Int = 0
    let colors: [Color] = [.orange, .red, .gray, .blue, .green,
                                    .purple, .pink]
    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }
    
    func decrementStep() {
        value -= 1
        if value <= 0 { value = colors.count - 1 }
    }
    
    var body: some View {
        Stepper {
            Text("Value: \(value) \nColor: \(colors[value].description)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .foregroundStyle(colors[value])
        
    }
}

#Preview {
    StepperView()
}


/// - Parameters:
///     - label: A view describing the purpose of this stepper.
///     - onIncrement: The closure to execute when the user clicks or taps
///       the control's plus button.
///     - onDecrement: The closure to execute when the user clicks or taps
///       the control's minus button.
///     - onEditingChanged: A closure called when editing begins and ends.
///       For example, on iOS, the user may touch and hold the increment
///       or decrement buttons on a `Stepper` which causes the execution
///       of the `onEditingChanged` closure at the start and end of
///       the gesture.


