//
//  ExtensionVerticalAlignment_2.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndTop: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndTop = VerticalAlignment(MidAccountAndTop.self)
}

struct ExtensionVerticalAlignment_2: View {
    var body: some View {
        HStack(alignment: .midAccountAndTop) {
            VStack {
                Text("@two straws")
                    .alignmentGuide(.midAccountAndTop) { d in d[VerticalAlignment.center] }
                Image(.paulHudson)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndTop) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ExtensionVerticalAlignment_2()
}
