//
//  ContentView.swift
//  ConventionContacts
//
//  Created by David Stanton on 4/17/24.
//
import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            List {
                Text("allo")
                Image("SquirtleHeadShot")
                    .resizable()
                    .scaledToFit()
            }
        }
        .navigationTitle("ConventionContacts")
        .toolbar {
            Button("Add Contact", systemImage: "plus") {
               PhotosPicker("Selected Photo", selection: $selectedItem)
            }
        }
        

    }
}

#Preview {
    ContentView()
}
