//
//  EditView.swift
//  BucketList_3
//
//  Created by David Stanton on 4/10/24.
//
// ==== EditView ====
// var: dismiss, location, name, description, onSave
// In a NavStack, users can change the name & description
// Button to save the new location, assigning a new UUID, and the name/description
// save the new Location and dismiss
// init for location and onSave that creates State structs
// preview is the example location
import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    @State private var name: String
    @State private var description: String
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Edit Location")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    EditView(location: Location.example) { _ in }
}
