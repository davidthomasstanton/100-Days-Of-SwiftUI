//
//  MagnifyGestureView.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct MagnifyGestureView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    var body: some View {
    Text("🥸")
        .font(.title)
        .padding()
        .background(.gray)
        .clipShape(.circle)
        .scaleEffect(finalAmount + currentAmount)
        .gesture(
            MagnifyGesture()
                .onChanged { value in
                    currentAmount = value.magnification - 1
                }
                .onEnded { value in
                    finalAmount += currentAmount
                    currentAmount = 0.0
                }
        )
    }
}

#Preview {
    MagnifyGestureView()
}
