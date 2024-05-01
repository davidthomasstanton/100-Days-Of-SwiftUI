//
//  CombinedGestureView_1.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct CombinedGestureView_1: View {
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
            .onEnded { _ in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combinedGesture = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .foregroundColor(isDragging ? .red : .blue)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1.0)
            .offset(offset)
            .gesture(combinedGesture)
        
    }
}

#Preview {
    CombinedGestureView_1()
}
