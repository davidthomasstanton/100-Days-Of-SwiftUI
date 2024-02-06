//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by David Stanton on 2/5/24.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            //animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        //.scaleEffect(animationAmount)
        //.blur(radius: (animationAmount - 1) * 3)
        .overlay (
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    ImplicitAnimations()
}
