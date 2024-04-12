//
//  ContentView.swift
//  BucketList_4
//
//  Created by David Stanton on 4/11/24.
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
import SwiftUI
import MapKit

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
           MKCoordinateRegion(
               center: CLLocationCoordinate2D(latitude: 31.7619, longitude: -106.4850),
               span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)))
    @State private var viewModel = ViewModel()
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(viewModel.locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.cirlce")
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
//            .onTapGesture {
//                let coordinate = proxy.convert
//            }
        }
    }
}

#Preview {
    ContentView()
}
