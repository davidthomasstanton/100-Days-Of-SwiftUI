//
//  EmojiRatingView.swift
//  Bookworm_4
//
//  Created by David Stanton on 3/19/24.
//
// EmojiRatingView
// switch that returns Emojis that correspond to the rating
import SwiftUI

struct EmojiRatingView: View {
    @Binding var rating: Int
    var body: some View {
        switch rating {
        case 1:
            Text("🥱")
        case 2:
            Text("🥸")
        case 3:
            Text("😀")
        case 4:
            Text("😍")
        case 5:
            Text("🤯")
        default:
            Text("🪨")
        }
    }
}

#Preview {
    EmojiRatingView(rating: .constant(3))
}
