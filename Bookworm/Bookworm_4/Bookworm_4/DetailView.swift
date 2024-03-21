//
//  DetailView.swift
//  Bookworm_4
//
//  Created by David Stanton on 3/19/24.
//
// DetailView
// Image of genre, text of the genre on top of it
// Text of author, reivew, star rating
// Preview do/try/catch
// set Modeal config, container, create example book, return the view with example book and modelContainer
// function to delete book with confirmation button
import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showindDeleteAlert = false
    var book: Book
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre)
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.system(size: 30))
                .foregroundStyle(.secondary)
                .padding()
            Text(book.date.formatted(date: .abbreviated, time: .omitted))
            Text(book.review)
                .font(.body)
                .padding()
            RatingView(rating: .constant(book.rating))
                .font(.system(size: 25))
            
        }
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showindDeleteAlert) {
            Button("Confirm", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showindDeleteAlert = true
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
        let example = Book(title: "Demo Title", author: "Person", genre: "Horror", review: "Scary!", rating: 2, date: .now)
        return DetailView(book: example)
            .modelContainer(container)

    } catch {
        return Text("Could not create preview")
    }
}
