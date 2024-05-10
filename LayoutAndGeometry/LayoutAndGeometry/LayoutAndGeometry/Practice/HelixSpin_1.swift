//
//  HelixSpin_1.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/9/24.
//

import SwiftUI

struct HelixSpin_1: View {
    let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .pink]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row: \(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .padding(0)
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                    }
                    .frame(height: 40)
                }
                
            }
        }
    }
}

#Preview {
    HelixSpin_1()
}
