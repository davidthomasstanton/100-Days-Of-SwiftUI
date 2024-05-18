//
//  ResortView.swift
//  SnowSeeker_4
//
//  Created by David Stanton on 5/17/24.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    @State private var showingFacilityInfo = false
    @State private var selectedFacility: Facility?
    @Environment(Favorites.self) var favorites
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    Text(resort.imageCredit)
                        .padding(9)
                        .background(.white.opacity(0.6))
                        .foregroundStyle(.black.opacity(0.8))
                        .offset(x: -3, y: -3)
                }
                HStack {
                    ResortDetailsView(resort: resort)
                    SkiDetailsView(resort: resort)
                }
                .background(.black.opacity(0.15))
                
                Text(resort.description)
                    .padding()
                Text("Facilities")
                    .font(.headline)
                    .padding(.horizontal)
                HStack {
                    ForEach(resort.facilityTypes) { facility in
                        Button {
                            showingFacilityInfo = true
                            selectedFacility = facility
                        } label: {
                            facility.icon
                                .font(.title)
                        }
                    }
//                    Text(resort.facilities, format: .list(type: .and))
//                        .padding()
                }
                .padding()
                
                Button(favorites.contains(resort) ? "Remove from favorites" : "Mark as favorite") {
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .navigationTitle("\(resort.name), \(resort.country)")
            .navigationBarTitleDisplayMode(.inline)
            .alert(selectedFacility?.name ?? "Information Lacking", isPresented: $showingFacilityInfo, presenting: selectedFacility) { _ in
            } message: { facility in
                Text(facility.description)
            }
        }
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites())
}
