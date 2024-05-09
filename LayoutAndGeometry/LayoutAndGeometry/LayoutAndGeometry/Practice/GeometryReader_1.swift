//
//  GeometryReader_1.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

struct GeometryReader_1: View {
    var body: some View {
        HStack {
            Text("The Singapore Airport Waterfall")
            
            GeometryReader { proxy in
                Image(.singaporeAirport)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    GeometryReader_1()
}
