//
//  TapCount.swift
//  WeSplit2
//
//  Created by David Stanton on 1/23/24.
//

import SwiftUI

struct TapCount: View {
    @State private var tapCount = 0
    
    var body: some View {
        NavigationStack {
            Button("Tap Count: \(tapCount)") {
                self.tapCount += 1
            }
        }
    }
}

#Preview {
    TapCount()
}
