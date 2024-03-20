//
//  DetailView.swift
//  Bookworm_4
//
//  Created by David Stanton on 3/19/24.
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
            Text(book.review)
                .font(.body)
                .padding()
            RatingView(rating: .constant(book.rating))
                .font(.system(size: 25))
            
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Demo Title", author: "Person", genre: "Horror", review: "Scary!", rating: 2)
        return DetailView(book: example)
            .modelContainer(container)

    } catch {
        return Text("Could not create preview")
    }
}
