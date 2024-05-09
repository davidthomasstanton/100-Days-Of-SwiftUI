//
//  GeometryReader_3.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

struct OuterView_3: View {
    var body: some View {
        VStack {
            Text("Top")
            
            InnerView_3()
                .background(.green)
            
            Text("Bottom")
        }
    }
}

struct InnerView_3: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global Center: \(proxy.frame(in: .global).midX) x / \(proxy.frame(in: .global).midY) y")
                        print("Custom Center: \(proxy.frame(in: .named("Custom")).midX) x / \(proxy.frame(in: .named("Custom")).midY) y")
                        print("Local Center: \(proxy.frame(in: .local).midX) x / \(proxy.frame(in: .local).midY) y")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}
struct GeometryReader_3: View {
    var body: some View {
        OuterView_3()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    GeometryReader_3()
}
