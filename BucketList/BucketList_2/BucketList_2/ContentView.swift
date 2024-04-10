//
//  ContentView.swift
//  BucketList_2
//
//  Created by David Stanton on 4/9/24.
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
// var: dismiss, name, description, onSave
// In a NavStack, users can change the name & description
// Button to save the new location, assigning a new UUID, and the name/description
// save the new Location and dismiss
// init for location and onSave that creates State structs
// preview is the example location
// ==== Location struct ====
// Codable, Equatable, Identifiable
// var: id, name, description, longitude, latitude,
// computed property for coordinate
// debug code for example location
// func (==) that returns true if the compared Locations have the same id

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
