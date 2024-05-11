//
//  ContentView.swift
//  LayoutAndGeometry_2
//
//  Created by David Stanton on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<100) { index in
                    GeometryReader { proxy in
                        Text("Row: \(index)")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity)
                            .background(Color(
                                hue: min(1.0, proxy.frame(in: .global).minY / fullView.frame(in: .global).height),
                                saturation: 1.0, brightness: 1.0))
                            .padding()
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY - fullView.frame(in: .global).height / 2 ) / 5,
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                            .opacity(proxy.frame(in: .global).minY / 300)
                            .scaleEffect(max(0.5, proxy.frame(in: .global).minY / 500))
                    }
                    .frame(height: 40)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}
