//
//  RatingView.swift
//  Bookworm_6
//
//  Created by David Stanton on 3/20/24.
//
// Rating View
// variables for rating (binded), maximumRating, offImage, onImage, offColor, onColor
// HStack that displays the label if it's not empty
// Go through the rating, 1->max rating (+1) and place a Button that sends back the number tapped, and displays the onColor if the star is equal or more than the number tapped
// function that sends an offImage in place of the onImage if it's number is higher than the rating
import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    let maximumRating = 5
    let starImage = Image(systemName: "star.fill")
    let onColor = Color.yellow
    let offColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    starImage
                        .foregroundStyle(rating < number ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
