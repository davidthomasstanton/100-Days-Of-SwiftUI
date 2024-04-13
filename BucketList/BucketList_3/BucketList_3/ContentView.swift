//
//  ContentView.swift
//  BucketList_3
//
//  Created by David Stanton on 4/10/24.
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
import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    
    @State private var viewModel = ViewModel()
    @AppStorage("mapStyle") var mapStyle = "standard"
    
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
            Button("Please Authenticate") {
                viewModel.authenticate()
            }
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
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
