//
//  Practice_ScrollView.swift
//  Moonshot
//
//  Created by David Stanton on 2/19/24.
//

import SwiftUI

// Scrolling View of a picture title, picture sized to frame
// below is a description that is generated with a struct
struct CustomText: View {
    let text: String
    
    var body: some View {
        Text("Description of \(text)")
            .italic()
    }
    
    init(text: String) {
        self.text = text
    }
}

struct Practice_ScrollView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 05) {
                ForEach(0..<100) { row in
                    Text("Picture: \(row)")
                        .font(.headline)
                    Image(.moonSalute)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.vertical) {
                            size, axis in
                            size * 0.3
                        }
                    CustomText(text: "moon landing")
                }
            }
        }
    }
}

#Preview {
    Practice_ScrollView()
}
