//
//  ExtensionVerticalAlignment.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName_1: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName_1 = VerticalAlignment(MidAccountAndName_1.self)
}

struct ExtensionVerticalAlignment: View {
    var body: some View {
        HStack(alignment: .midAccountAndName_1) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName_1) { d in
                        d[VerticalAlignment.center]
                    }
                Image(.paulHudson)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName_1) { d in
                        d[VerticalAlignment.center]
                    }
            }
        }
    }
}

#Preview {
    ExtensionVerticalAlignment()
}
