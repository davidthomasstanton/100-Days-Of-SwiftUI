//
//  BlurView.swift
//  Instafilter
//
//  Created by David Stanton on 3/30/24.
//

import SwiftUI

struct BlurView: View {
    @State private var blurAmount = 0.0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .blur(radius: blurAmount)
            .padding()
        Slider(value: $blurAmount, in: 0.0...20.0)
            .onChange(of: blurAmount) { oldValue, newValue in
                print("Old Value: \(oldValue)")
                print("New Value: \(newValue)")
            }
            .padding()
        Button("Random Blur") {
            blurAmount = Double.random(in: 0.0...20.0)
        }
    }
}

#Preview {
    BlurView()
}
