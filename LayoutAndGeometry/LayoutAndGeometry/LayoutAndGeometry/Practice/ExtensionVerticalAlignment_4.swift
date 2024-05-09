//
//  ExtensionVerticalAlignment_4.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName_4: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccoundAndName_4 = VerticalAlignment(MidAccountAndName_4.self)
}

struct ExtensionVerticalAlignment_4: View {
    var body: some View {
        HStack(alignment: .midAccoundAndName_4) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccoundAndName_4) { d in d[VerticalAlignment.center] }
                Image(.paulHudson)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccoundAndName_4) { d in d[VerticalAlignment.center] }
            }
        }
    }
}

#Preview {
    ExtensionVerticalAlignment_4()
}
