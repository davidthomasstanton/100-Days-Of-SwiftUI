//
//  HelixSpin_2.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/9/24.
//

import SwiftUI

struct HelixSpin_2: View {
    let colors: [Color] = [.green, .brown, .blue, .black, .yellow, .orange, .red]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<100) { index in
                    GeometryReader { proxy in
                        Text("Row: \(index)")
                            .font(.title)
                            .foregroundStyle((index % 7 == 3) ? .white : .black)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }
                    .frame(minHeight: 30)
                }
            }
        }
    }
}

#Preview {
    HelixSpin_2()
}

