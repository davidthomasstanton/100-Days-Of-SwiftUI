//
//  SkiDetailsView.swift
//  SnowSeeker_4
//
//  Created by David Stanton on 5/17/24.
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
                    .font(.title)
            }
            
            VStack {
                Text("Snow Depth")
                    .font(.headline)
                Text("\(resort.snowDepth)cm")
                    .font(.title)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SkiDetailsView(resort: .example)
}
