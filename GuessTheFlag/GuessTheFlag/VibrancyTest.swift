//
//  VibrancyTest.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct VibrancyTest: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your content")
                .foregroundStyle(.secondary)
                .foregroundColor(.white)
                .padding(50).background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    VibrancyTest()
}
