//
//  MultipleAnimations.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct MultipleAnimations: View {
    @State private var enabled = false
    var body: some View {
        Button("Modify") {
            enabled.toggle()
        }
        .padding(50)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}

#Preview {
    MultipleAnimations()
}
