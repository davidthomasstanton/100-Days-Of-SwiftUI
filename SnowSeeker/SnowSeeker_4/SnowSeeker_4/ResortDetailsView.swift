//
//  ResortDetailsView.swift
//  SnowSeeker_4
//
//  Created by David Stanton on 5/17/24.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    var displayPrice: String {
        String(repeating: "$", count: resort.price)
    }
    
    var displaySize: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Price")
                    .font(.headline)
                Text(displayPrice)
                    .font(.title)
            }
            
            VStack {
                Text("Size")
                    .font(.headline)
                Text(displaySize)
                    .font(.title)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
