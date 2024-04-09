//
//  ContentView.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//

// ==== ContentView ====
// create startPosition (L&L: 56 / -3; span: 10 / 10)
// array of Location (locations)
// Inside a MapReader, create a map with the start position
// go throu
import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    )
    
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    let newLocation = Location(id: UUID(), name: "new location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                }
            }
            .sheet(item: $selectedPlace) { place in
                Text(place.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
