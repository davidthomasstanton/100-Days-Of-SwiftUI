//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by David Stanton on 2/5/24.
//

import SwiftUI

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0
    var body: some View {
        
        VStack {
            // Button that spins when you click it
            Button("Tap me") {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))
         
            Button("Click Me") {
                withAnimation(.spring(duration: 1, bounce: 0.2)) {
                    animationAmount += 350
                }
            }
            .padding(50)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(
                .degrees(animationAmount), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
            )
        }
    }
}

#Preview {
    ExplicitAnimations()
}
