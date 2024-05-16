//
//  ResortView.swift
//  SnowSeeker_1
//
//  Created by David Stanton on 5/15/24.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    ResortDetailsView(resort: resort)
                    SkiDetailsView(resort: resort)
                }
                .padding(.vertical)
                .background(.black.opacity(0.2))
                
                Group {
                    Text(resort.description)
                        .font(.body)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                        .padding(.vertical)
                    
                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ResortView(resort: .example)
}
