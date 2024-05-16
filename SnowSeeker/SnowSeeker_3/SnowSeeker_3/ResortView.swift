//
//  ResortView.swift
//  SnowSeeker_3
//
//  Created by David Stanton on 5/15/24.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                    .background(.black.opacity(0.2))
                    
                    Group {
                        Text("Description")
                            .font(.headline)
                            .padding(.vertical)
                        
                        Text(resort.description)
                            .font(.body)
                                                
                        Text("Facilities")
                            .font(.headline)
                            .padding(.vertical)
                        Text(resort.facilities, format: .list(type: .and))
                    
                    }
                    .padding(.horizontal)
                }
                
                
                
                
            }
            .navigationTitle("\(resort.name)")
//            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ResortView(resort: .example)
}
