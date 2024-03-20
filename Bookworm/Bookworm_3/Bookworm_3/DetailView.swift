//
//  DetailView.swift
//  Bookworm_3
//
//  Created by David Stanton on 3/18/24.
//
// DetailView
// Image of genre underneath the text of the genre
// Display the Author, the review, the RatingView
// Preview{} do/try/catch
// create config, container, example book, then return the DetailView() with attached modelContainer
import SwiftData
import SwiftUI

struct DetailView: View {
    var book: Book
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                Text(book.genre)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(.black.opacity(0.75))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title.bold())
                .padding()
                .foregroundStyle(.secondary)
            Text(book.review)
                .padding()
            RatingView(rating: .constant(book.rating))
                .font(.title)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Title", author: "Author", genre: "Thriller", review: "meh", rating: 2)
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview \(error.localizedDescription)")
    }
}
