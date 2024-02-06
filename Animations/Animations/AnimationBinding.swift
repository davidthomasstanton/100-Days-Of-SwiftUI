//
//  AnimationBinding.swift
//  Animations
//
//  Created by David Stanton on 2/5/24.
//

import SwiftUI

struct AnimationBinding: View {
    @State private var animationAmount = 1.0
    var body: some View {
        print(animationAmount)
        
        return VStack {
            
            //Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            
            Stepper("Scale Amount", value: $animationAmount.animation(
                .easeOut(duration: 0.5)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    
    }
}

#Preview {
    AnimationBinding()
}
