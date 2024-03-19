//
//  RatingView.swift
//  Bookworm_3
//
//  Created by David Stanton on 3/18/24.
//
// Rating View
// variables for rating (binded), label, maximumRating, offImage, onImage, offColor, onColor
// HStack that displays the label if it's not empty
// Go through the rating, 1->max rating (+1) and place a Button that sends back the number tapped, and displays the onColor if the star is equal or more than the number tapped
// function that sends an offImage in place of the onImage if it's number is higher than the rating

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    let maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    print("Tapped \(number)")
                    rating = number
                } label: {
                    onImage
                        .foregroundStyle(number > rating ? offColor: onColor)
                }
            }
        }
    }
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
