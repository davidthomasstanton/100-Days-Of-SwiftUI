//
//  Location.swift
//  BucketList_4
//
//  Created by David Stanton on 4/11/24.
//
// ==== Location struct ====
// Codable, Equatable, Identifiable
// var: id, name, description, longitude, latitude,
// computed property for coordinate
// debug code for example location
// func (==) that returns true if the compared Locations have the same id
import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    #if DEBUG
    static let example = Location(id: UUID(), name: "El Paso, Texas", description: "Hive of scum and villany", latitude: 31.7619, longitude: 106.4850)
    #endif
    
}
