//
//  ResortDetailsView.swift
//  SnowSeeker_3
//
//  Created by David Stanton on 5/15/24.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.headline)
                Text(size)
                    .font(.title3)
            }
            VStack {
                Text("Price")
                    .font(.headline)
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
