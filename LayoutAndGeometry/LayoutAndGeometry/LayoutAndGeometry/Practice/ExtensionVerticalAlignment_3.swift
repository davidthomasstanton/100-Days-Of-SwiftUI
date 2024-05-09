//
//  ExtensionVerticalAlignment_3.swift
//  LayoutAndGeometry
//
//  Created by David Stanton on 5/8/24.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName_3: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName_3 = VerticalAlignment(MidAccountAndName_3.self)
}

struct ExtensionVerticalAlignment_3: View {
    var body: some View {
        HStack(alignment: .midAccountAndName_3) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName_3) { d in
                        d[VerticalAlignment.center]
                    }
                Image(.paulHudson)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full Name")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName_3) { d in
                        d[VerticalAlignment.center]
                    }
            }
        }
    }
}

#Preview {
    ExtensionVerticalAlignment_3()
}
