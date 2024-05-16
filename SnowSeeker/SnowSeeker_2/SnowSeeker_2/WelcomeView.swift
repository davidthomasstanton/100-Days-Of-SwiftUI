//
//  WelcomeView.swift
//  SnowSeeker_2
//
//  Created by David Stanton on 5/15/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            Text("Please select a resort on the left hand menu; swipe to select it.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
