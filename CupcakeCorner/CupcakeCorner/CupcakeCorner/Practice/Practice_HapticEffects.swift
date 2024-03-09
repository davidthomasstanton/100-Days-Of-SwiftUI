//
//  Practice_HapticEffects.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/9/24.
//

import SwiftUI
import CoreHaptics

struct Practice_HapticEffects: View {
    @State private var counter = 0
    @State private var engine: CHHapticEngine?
    var body: some View {
        Button("Counter: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
        
        Button("Complex Haptics", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
    }
    func prepareHaptics() {
        
    }
    func complexSuccess() {
        
    }
}

#Preview {
    Practice_HapticEffects()
}
