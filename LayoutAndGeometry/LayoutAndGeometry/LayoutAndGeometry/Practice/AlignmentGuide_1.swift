//
//  AlignmentGuide_1.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

struct AlignmentGuide_1: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { num in
                Text("Number \(num + 1)")
                    .alignmentGuide(.leading) { _ in
                        Double(num) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 300)
        .background(.blue)
    }
}

#Preview {
    AlignmentGuide_1()
}
