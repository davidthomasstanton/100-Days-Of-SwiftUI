//
//  CombinedGestureView_3.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct CombinedGestureView_3: View {
    @State private var isDragging = false
    @State private var offset = CGSize.zero
    
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
        
        let combined = pressGesture.sequenced(before: dragGesture)
        Circle()
            .fill(isDragging ? .orange : .blue)
            .frame(width: 64, height: 64)
            .offset(offset)
            .scaleEffect(isDragging ? 1.5 : 1.0)
            .gesture(combined)
    }
}

#Preview {
    CombinedGestureView_3()
}
