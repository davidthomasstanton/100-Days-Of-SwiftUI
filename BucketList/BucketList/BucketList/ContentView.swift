//
//  ContentView.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//
// ==== ContentView ====
// create startPosition (L&L: 56 / -3; span: 10 / 10)
// var: array of Location (locations), optional Location (selectedPlace)
// Inside a MapReader, create a map with the start position
// ForEach location, create an Annotation with an Image
// On a longPress, assign the location to selectedPlace
// On a TapGesture, create a coordinate from the tap position
// Create a newLocation and append it to locations
// Slide in a sheet for the longPress, go to the EditView passing in the place and
// ...the newLocation, replace the index if it's there already
// ==== EditView ====
// LoadingState enum with cases loading, loaded, failed
// var: dismiss, location, name, description, onSave
// var: loadingState, default .loading, pages: array of Page
// In a NavStack, users can change the name & description
// Section that shows nearby wikipedia entries, switch case for each enum
// Button to save the new location, assigning a new UUID, and the name/description
// task that executes fetchNearbyPlaces
// func fetchNearbyPlaces
// set urlString, make it into a url
// in a do block, get data, decode into items
// assign sorted values to pages
// set loading state if successful or if failed
// save the new Location and dismiss
// init for location and onSave that creates State structs
// preview is the example location
// ==== Location struct ====
// Codable, Equatable, Identifiable
// var: id, name, description, longitude, latitude,
// computed property for coordinate
// debug code for example location
// func (==) that returns true if the compared Locations have the same id
// ==== Result ====
// three codable Structs
// Result that has a query: Query
// Query that has pages: [Int: Page]
// Page that is Comparable and has pageId: Int, title: String, terms: [String: [String]]?
// var description that returns terms?["description"]?.first if it exists, or pro forma text
// sorting function that sorts by title
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
                EditView(location: place) { newLocation in
                    if let index = locations.firstIndex(of: place) {
                        locations[index] = newLocation
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
