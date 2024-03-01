//
//  Gestures.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct Gestures: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in dragAmount = .zero }
            )
    }
}

#Preview {
    Gestures()
}
