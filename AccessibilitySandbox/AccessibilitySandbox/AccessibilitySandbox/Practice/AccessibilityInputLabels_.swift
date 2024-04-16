//
//  AccessibilityInputLabels_.swift
//  AccessibilitySandbox
//
//  Created by David Stanton on 4/15/24.
//

import SwiftUI

struct AccessibilityInputLabels_: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button Tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "JFK", "Kennedy"])
    }
}

#Preview {
    AccessibilityInputLabels_()
}
