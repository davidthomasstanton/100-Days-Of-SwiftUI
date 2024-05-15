//
//  NavSplitView_1.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

struct NavSplitView_1: View {
    var body: some View {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Detail") {
                Text("Nav Linked")
            }
        } detail: {
            Text("Content")
        }
    }
}

#Preview {
    NavSplitView_1()
}
