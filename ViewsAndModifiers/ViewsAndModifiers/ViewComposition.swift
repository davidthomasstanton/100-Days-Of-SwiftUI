//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by David Stanton on 1/27/24.
//

import SwiftUI

struct ViewComposition: View {
    var body: some View {
        VStack (spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
    Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

#Preview {
    ViewComposition()
}
