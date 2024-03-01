//
//  ExplicitAnimation_1.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct ExplicitAnimation_1: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Animate Me") {
            withAnimation {
                animationAmount += 360
            }
        }
        .padding(70)
        .background(.gray)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))
    }
}

#Preview {
    ExplicitAnimation_1()
}
