//
//  SkiDetailsView.swift
//  SnowSeeker_3
//
//  Created by David Stanton on 5/15/24.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.headline)
                Text("\(resort.elevation)m")
                    .font(.title3)
            }
            VStack {
                Text("Snow Depth")
                    .font(.headline)
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
}

#Preview {
    SkiDetailsView(resort: .example)
}
