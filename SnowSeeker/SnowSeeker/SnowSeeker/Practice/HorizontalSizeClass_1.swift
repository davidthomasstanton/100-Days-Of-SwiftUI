//
//  HorizontalSizeClass_1.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

struct UserView_1: View {
    var body: some View {
        Group {
            Text("Jules")
            Text("Treatos")
            Text("Many pets")
        }
        .font(.title)
    }
}
struct HorizontalSizeClass_1: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            VStack(content: UserView_1.init)
        } else {
            HStack(content: UserView_1.init)
        }
    }
}

#Preview {
    HorizontalSizeClass_1()
}
