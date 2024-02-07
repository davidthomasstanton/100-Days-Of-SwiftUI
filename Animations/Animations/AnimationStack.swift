//
//  AnimationStack.swift
//  Animations
//
//  Created by David Stanton on 2/6/24.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false
    @State private var enabled2 = false
    var body: some View {
        VStack{
            Button("Click Me") {
                // do work
                enabled.toggle()
            }
            .frame(width:200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundStyle(.white)
            .animation(.default, value: enabled)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
            
            Button("Tap Me") {
                enabled2.toggle()
            }
            .frame(width: 200, height: 200)
            .foregroundStyle(.white)
            .background(enabled2 ? .brown : .gray)
            .clipShape(.rect(cornerRadius: enabled2 ? 100 : 0))
            .animation(.spring(duration: 1, bounce: 0.7), value: enabled2)
        }
    }
}

#Preview {
    AnimationStack()
}
