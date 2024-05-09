//
//  GeometryReader_2.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

struct OuterView_2: View {
    var body: some View {
        VStack {
            Text("Top")
            
            InnerView_2()
                .background(.green)
            
            Text("Bottom")
        }
        
    }
}

struct InnerView_2: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global Center: \(proxy.frame(in: .global).midX)x \(proxy.frame(in: .global).midY)x")
                        print("Custom Center: \(proxy.frame(in: .named("Custom")).midX)x \(proxy.frame(in: .named("Custom")).midY)y")
                        print("Local Center: \(proxy.frame(in: .local).midX)x \(proxy.frame(in: .local).midY)y")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}
struct GeometryReader_2: View {
    var body: some View {
        OuterView_2()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    GeometryReader_2()
}
