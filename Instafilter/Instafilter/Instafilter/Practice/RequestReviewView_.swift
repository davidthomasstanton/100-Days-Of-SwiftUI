//
//  RequestReviewView_.swift
//  Instafilter
//
//  Created by David Stanton on 4/2/24.
//
import StoreKit
import SwiftUI

struct RequestReviewView_: View {
    @Environment(\.requestReview) var requestReview
    var body: some View {
        Button("Request Review") {
            requestReview()
        }
    }
}

#Preview {
    RequestReviewView_()
}
