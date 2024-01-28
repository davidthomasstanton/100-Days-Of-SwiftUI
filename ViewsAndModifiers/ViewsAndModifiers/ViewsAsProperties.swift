//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by David Stanton on 1/27/24.
//

import SwiftUI

struct ViewsAsProperties: View {
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var motto3: some View {
        Text("Draco dormiens")
    }
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
            motto3
            spells

        }
    }
}

#Preview {
    ViewsAsProperties()
}
