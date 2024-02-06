//
//  AnimationPractice_1.swift
//  Animations
//
//  Created by David Stanton on 2/5/24.
//

import SwiftUI

struct AnimationPractice_1: View {
    @State private var animationAmount = 1.0
    @State private var animationOverlay = 1.0
    @State private var animOverlayStart = 1.0
    @State private var animOverlayEnd = 2.0
    
    var body: some View {
        VStack {
            // Button that increases with size every time you tap it
            Button("Click me") {
                // Increase Size
                animationAmount += 0.5
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .animation(.linear, value: animationAmount)
            
            // Button with overlay 'click me' effect
            Button("Click me") {
                //
                
            }
            .padding(50)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.blue)
                    .scaleEffect(animationOverlay)
                    .opacity(2 - animationOverlay)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationOverlay)
            )
            .onAppear {
                animationOverlay = 2.0
            }
        }
    }
}

#Preview {
    AnimationPractice_1()
}
