//
//  Map_View.swift
//  BucketList
//
//  Created by David Stanton on 4/6/24.
//
import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
}

struct Map_View: View {
    let locations = [
        Location(name: "Buckingham Palace", coordinates: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinates:
            CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    var body: some View {
        VStack {
            MapReader { proxy in
                Map()
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print(coordinate)
                        }
                    }
            }
        }
//        Map(position: $position)
//            .mapStyle(.hybrid(elevation: .realistic))
//            .onMapCameraChange { context in
//                print(context.region)
//            }
//
//        HStack(spacing: 50) {
//            Button("Paris") {
//                position = MapCameraPosition.region(
//                MKCoordinateRegion(
//                    center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
//                )
//            }
//
//            Button("Tokyo") {
//                position = MapCameraPosition.region(
//                MKCoordinateRegion(
//                    center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
//                )
//            }
//        }
    }
}
#Preview {
    Map_View()
}
