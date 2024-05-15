//
//  ViewThatFits_1.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

struct ViewThatFits_1: View {
    var body: some View {
        ViewThatFits {
            Rectangle().frame(width: 400, height: 200)
            Circle().frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ViewThatFits_1()
}
