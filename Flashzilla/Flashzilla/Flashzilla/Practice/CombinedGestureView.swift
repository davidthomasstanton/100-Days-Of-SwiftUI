//
//  CombinedGestureView.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct CombinedGestureView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .foregroundColor(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1.0)
            .offset(offset)
            .gesture(combined)
    }
}

#Preview {
    CombinedGestureView()
}
