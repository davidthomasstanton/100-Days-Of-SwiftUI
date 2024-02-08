//
//  CustomTransition_Practice.swift
//  Animations
//
//  Created by David Stanton on 2/7/24.
//

import SwiftUI
/*
struct CornerRotateModifier: ViewModifier {
    var degrees: Double
    var anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            //.rotationEffect(degrees, anchor: .anchor)
    }
}
 */

struct CustomTransition_Practice: View {
    @State private var isBlue = false
    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(width: 200, height: 200)
        
        
    }
}

#Preview {
    CustomTransition_Practice()
}
