//
//  AnimationPractice_2.swift
//  Animations
//
//  Created by David Stanton on 2/6/24.
//

import SwiftUI

struct AnimationPractice_2: View {
    @State private var animOverlay = 1.0
    @State private var enabled = false
    @State private var isShape = false
    @State private var shapeSize = 20.0
    
    var body: some View {
        VStack {
            // button that changes shape on tap
            Button("tap to change") {
                enabled.toggle()
            }
            .padding(20)
            .background(enabled ? .black : .gray)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.linear(duration: 2), value: enabled)
            
            // Overlay circle
            Button("Tap me") {
                animOverlay = 2.0
            }
            .padding(shapeSize)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.indigo)
                    .scaleEffect(animOverlay)
                    .opacity(2 - animOverlay)
                    .animation(.easeOut(duration: 1.7).repeatForever(autoreverses: false), value: animOverlay)
                    .animation(nil, value: animOverlay)
            )
            
            // insert shape with transition
            Button("Insert") {
                isShape.toggle()
            }
            .font(.headline)
            
            if isShape {
                Rectangle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
            // Stepper that controls size
            Stepper("Shape Size", value: $shapeSize.animation(.spring(.bouncy)), in: 20...100)
            
        }
        .onAppear {
            animOverlay = 2.0
        }
    }
}

#Preview {
    AnimationPractice_2()
}
