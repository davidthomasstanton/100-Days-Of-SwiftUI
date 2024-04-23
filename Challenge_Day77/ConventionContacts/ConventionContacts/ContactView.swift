//
//  ContactView.swift
//  ConventionContacts
//
//  Created by David Stanton on 4/22/24.
//
import SwiftData
import SwiftUI

struct ContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    let contact: Contact
    @State private var showingDelete = false
    var body: some View {
        ScrollView {
            loadImage(from: contact)
                .resizable()
                .scaledToFit()
            
            VStack {
                Text(contact.name)
                    .font(.title)
                Text(contact.company)
            }
        }
        .navigationTitle(contact.name)
        .toolbar {
            Button("Delete") {
                showingDelete = true
            }
        }
        .alert("Delete Contact?", isPresented: $showingDelete) {
            Button("Delete", role: .destructive, action: deleteContact)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to delete contact?")
        }
    }
    
    func loadImage(from contact: Contact) -> Image {
        guard let uiImage = UIImage(data: contact.photo) else { return Image("SquirtleHeadShot") }
        return Image(uiImage: uiImage)
    }
    
    func deleteContact() {
        modelContext.delete(contact)
        dismiss()
    }
}

#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Contact.self, configurations: config)
//        return ContactView(contact: Contact.exampleContact)
//            .modelContainer(container)
//    } catch {
//        return Text("Failed to create preview \(error.localizedDescription)")
//    }
    ContactView(contact: Contact.exampleContact)
}
