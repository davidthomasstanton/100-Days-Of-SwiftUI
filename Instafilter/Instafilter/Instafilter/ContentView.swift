//
//  ContentView.swift
//  Instafilter
//
//  Created by David Stanton on 3/30/24.
//

import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
