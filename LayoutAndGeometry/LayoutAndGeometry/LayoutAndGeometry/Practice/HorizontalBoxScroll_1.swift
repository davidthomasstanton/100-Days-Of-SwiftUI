//
//  HorizontalBoxScroll_1.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/9/24.
//

import SwiftUI

struct HorizontalBoxScroll_1: View {
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1..<20) { index in
                        GeometryReader { proxy in
                            Text("[]Box: \(index)[]")
                                .font(.largeTitle)
                                .padding()
                                .background(.blue)
                                .rotation3DEffect(
                                    .degrees(-proxy.frame(in: .global).minX + fullView.size.width / 3) / 8,
                                    axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                                )
                                .frame(width: 200, height: 200)
                        }
                        .frame(width: 200, height: 200)
                    }
                }
            }
            
        }
    }
}

#Preview {
    HorizontalBoxScroll_1()
}
