//
//  ContentView-ViewModel.swift
//  BucketList_2
//
//  Created by David Stanton on 4/11/24.
//
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
import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Failed to save to \(savePath)")
            }
        }
        
        func addLocation(at coordinate: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
    }
}
