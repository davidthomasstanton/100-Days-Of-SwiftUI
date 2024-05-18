//
//  Welcome View.swift
//  SnowSeeker_4
//
//  Created by David Stanton on 5/17/24.
//

import SwiftUI

struct Welcome_View: View {
    var body: some View {
        Group {
            Text("Welcome to SnowSeeker_v4")
                .font(.largeTitle)
            Text("Please swipe from the left to see a list of resorts.")
        }
    }
}

#Preview {
    Welcome_View()
}
