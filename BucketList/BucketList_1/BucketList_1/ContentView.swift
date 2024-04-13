//
//  ContentView.swift
//  BucketList_1
//
//  Created by David Stanton on 4/9/24.
//
// ==== ContentView ====
// create startPosition (L&L: 56 / -3; span: 10 / 10)
// create ViewModel
// Inside a MapReader, create a map with the start position
// ForEach location, create an Annotation with an Image
// On a longPress, assign the location to selectedPlace
// On a TapGesture, convert the position to a coordinate and add the location
// when sheet is pulled up, set the item to the selectedPlace
// send that place to the EditView location and have the viewModel update
// ==== ViewModel ====
// in an extension of ContentView, create an observable class
// var: locations, selectedPlace, savePath: "SavedPlaces"
// initializer that decodes data from the savePath or sets an empty array
// save() that writes encoded data to the savePath with options
// addLocation() at a CLLocationCoordinate2D point
// create a new location at the point, append it to locations and save
// update() locations
// make sure the selectedPlace exists
// set the index to the first Index of locations, add the location at that index & save
// ==== EditView ====
// LoadingState enum with cases loading, loaded, failed
// var: dismiss, location, name, description, onSave
// var: loadingState, default .loading, pages: array of Page
// In a NavStack, users can change the name & description
// Section that shows nearby wikipedia entries, switch case for each enum
// Button to save the new location, assigning a new UUID, and the name/description
// task that executes fetchNearbyPlaces
// fetchNearbyPlaces()
// set urlString, make it into a url
// in a do block, get data, decode into items
// assign sorted values to pages
// set loading state if successful or if failed
// save the new Location and dismiss
// init for location and onSave that creates State structs
// preview is the example location
// ==== Result ====
// three codable Structs
// Result that has a query: Query
// Query that has pages: [Int: Page]
// Page that is Comparable and has pageId: Int, title: String, terms: [String: [String]]?
// var description that returns terms?["description"]?.first if it exists, or pro forma text
// sorting function that sorts by title
// ==== Location struct ====
// Codable, Equatable, Identifiable
// var: id, name, description, longitude, latitude,
// computed property for coordinate
// debug code for example location
// func (==) that returns true if the compared Locations have the same id
import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = ViewModel()
    @AppStorage("mapStyle") private var mapStyle = "standard"

    var body: some View {
        if viewModel.isUnlocked {
            VStack {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .mapStyle(mapStyle == "standard" ? .standard : .hybrid)
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                }
                Picker("Map Style", selection: $mapStyle) {
                    Text("Standard")
                        .tag("standard")
                    Text("Hybrid")
                        .tag("hybrid")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .alert("Error", isPresented: $viewModel.isShowingAuthenticationError) {
                    Button("OK") { }
                } message: {
                    Text(viewModel.authenticationError)
                }
        }
    }
}

#Preview {
    ContentView()
}
