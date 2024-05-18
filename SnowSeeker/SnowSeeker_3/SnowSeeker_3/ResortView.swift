//
//  ResortView.swift
//  SnowSeeker_3
//
//  Created by David Stanton on 5/15/24.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favorites.self) var favorites
    
    @State private var selectedFacility: Facility?
    @State private var isShowingMessage = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(decorative: resort.id)
                            .resizable()
                            .scaledToFit()
                        Text(resort.imageCredit)
                            .padding(10)
                            .background(.black.opacity(0.5))
                            .foregroundStyle(.white)
                            .offset(x: -5, y: -5)
                    }
                    HStack {
                        if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                            VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                            VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        } else {
                            ResortDetailsView(resort: resort)
                            SkiDetailsView(resort: resort)
                        }
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
                        HStack {
                            ForEach(resort.facilityTypes) { facility in
                                Button {
                                    selectedFacility = facility
                                    isShowingMessage = true
                                } label: {
                                    facility.icon
                                        .font(.title)
                                }
                            }
                        }
                        
                        Button(favorites.contains(resort) ? "Remove resort from favorites" : "Add resort to favorites") {
                            if favorites.contains(resort) {
                                favorites.remove(resort)
                            } else {
                                favorites.add(resort)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline)
            .alert(selectedFacility?.name ?? "Unknown Facility", isPresented: $isShowingMessage, presenting: selectedFacility) { _ in } message: { facility in
                Text(facility.description)
            }
        }
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
