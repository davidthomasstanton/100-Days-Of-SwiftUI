//
//  ContentShapeView.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct ContentShapeView: View {
    var body: some View {
        VStack {
            Text("Hello...")
            
            Spacer()
                .frame(height: 300)
            
            Text("World")
        }
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    ContentShapeView()
}
