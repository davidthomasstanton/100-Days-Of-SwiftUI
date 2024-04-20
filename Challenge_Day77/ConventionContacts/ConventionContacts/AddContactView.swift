//
//  AddContactView.swift
//  ConventionContacts
//
//  Created by David Stanton on 4/18/24.
//
import PhotosUI
import SwiftData
import SwiftUI

struct AddContactView: View {
    @State private var name: String = ""
    @State private var company: String = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var imageData: Data?
    @State private var uiImage: UIImage?
    @State private var processedImage: Image?

    
    var body: some View {
        NavigationStack {
            PhotosPicker(selection: $selectedItem) {
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No Image", systemImage: "photo.badge.plus", description: Text("Tap to Add Photo from Library"))
                }
            }
            .onChange(of: selectedItem, loadImage)
            Form {
                TextField("Name", text: $name)
                TextField("Company", text: $company)
            }
            Button("Add Contact") {
                let newContact = Contact(id: UUID(), name: name, company: company, photo: imageData!)
            }
        }
        .navigationTitle("Add Contact")
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let uiImage = UIImage(data: imageData) else { return }
            processedImage = Image(uiImage: uiImage)
        }
    }
}

#Preview {
    AddContactView()
}
