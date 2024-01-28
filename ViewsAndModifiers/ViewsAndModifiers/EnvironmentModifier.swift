//
//  EnvironmentModifier.swift
//  ViewsAndModifiers
//
//  Created by David Stanton on 1/27/24.
//

import SwiftUI

struct EnvironmentModifier: View {
    @State private var blurAmount = 0
    
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
                .blur(radius: 2.0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .blur(radius: 03)
    }
    
    
}

#Preview {
    EnvironmentModifier()
}
