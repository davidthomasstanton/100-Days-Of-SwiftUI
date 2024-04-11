//
//  EditView.swift
//  BucketList_1
//
//  Created by David Stanton on 4/9/24.
//
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
import SwiftUI

struct EditView: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    
    @Environment(\.dismiss) var dismiss
    var location: Location
    @State private var name: String
    @State private var description: String
    let onSave: (Location) -> Void
    
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
                Section("Nearby") {
                    switch loadingState {
                    case .loading:
                        Text("Loading")
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later")
                    }
                }
            }
            .navigationTitle("Edit Location")
            .toolbar {
                Button("Save", systemImage: "plus") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    // func fetchNearbyPlaces
    // set urlString, make it into a url
    // in a do block, get data, decode into items
    // assign sorted values to pages
    // set loading state if successful or if failed
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            loadingState = .failed
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            pages = items.query.pages.values.sorted()
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }
        
    }
}

#Preview {
    EditView(location: Location.example) { _ in }
}
