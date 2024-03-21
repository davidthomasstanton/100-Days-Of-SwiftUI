//
//  DetailView.swift
//  Bookworm_1
//
//  Created by David Stanton on 3/18/24.
//
// DetailView
// Image of genre, text of the genre on top of it
// Text of author, reivew, star rating
// Preview do/try/catch
// set Modeal config, container, create example book, return the view with example book and modelContainer
// function to delete book with confirmation button and programmatic dismiss

import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var book: Book
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .padding(8)
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            Text(book.date.formatted(date: .abbreviated, time: .omitted))
            Text(book.review)
                .padding()
            RatingView(rating: .constant(book.rating))
                .font(.title)
                
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete Book", isPresented: $showingDeleteAlert) {
            Button("Confirm", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure, bro?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    
    }
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Sample Title", author: "Sample Author", genre: "Fantasy", review: "Good?", rating: 3, date: .now)
        return DetailView(book: example)
            .modelContainer(container)

    } catch {
        return Text("Failed to create preview \(error.localizedDescription)")
    }
}
