//
//  ContainerRelativeFrame.swift
//  Review
//
//  Created by David Stanton on 3/1/24.
//

import SwiftUI

struct ContainerRelativeFrame: View {
    var body: some View {
        Image("WhiteComputer")
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContainerRelativeFrame()
}
