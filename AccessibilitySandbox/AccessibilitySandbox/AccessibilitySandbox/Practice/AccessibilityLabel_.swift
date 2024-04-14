//
//  AccessibilityLabel_.swift
//  AccessibilitySandbox
//
//  Created by David Stanton on 4/13/24.
//

import SwiftUI

struct AccessibilityLabel_: View {
    let pictures = [
    "ales-krivec-15949",
    "galina-n-189483",
    "kevin-horstmann-141705",
    "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    @State private var selectedImage = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedImage])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedImage = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedImage])
            .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    AccessibilityLabel_()
}
