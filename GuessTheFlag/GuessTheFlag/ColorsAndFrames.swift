//
//  ColorsAndFrames.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct ColorsAndFrames: View {
    var body: some View {
        ZStack {
            Color.primary
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
            LinearGradient(colors: [.white, .red], startPoint: .top, endPoint: .bottom)
                .frame(width: 200, height: 200)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)

        }
        .ignoresSafeArea()
    }
}

#Preview {
    ColorsAndFrames()
}
