//
//  DetailView.swift
//  Bookworm_5
//
//  Created by David Stanton on 3/20/24.
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
    let book: Book
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                Text(book.genre)
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            Text(book.date.formatted(date: .abbreviated, time: .omitted))
            RatingView(rating: .constant(book.rating))
                .font(.title)
                .padding()
            Text(book.review)
                .font(.body)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let exampleBook = Book(title: "Sample Title", author: "An Author", genre: "Fantasy", review: "More detail here", rating: 3, date: .now)
        return DetailView(book: exampleBook)
            .modelContainer(container)

    } catch {
        return Text("Failed to create preview \(error.localizedDescription)")
    }
}
