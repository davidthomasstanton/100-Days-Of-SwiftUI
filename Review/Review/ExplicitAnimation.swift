//
//  ExplicitAnimation.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Explicit Animation Demo") {
            withAnimation {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(.capsule)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ExplicitAnimation()
}
