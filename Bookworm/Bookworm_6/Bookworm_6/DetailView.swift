//
//  DetailView.swift
//  Bookworm_6
//
//  Created by David Stanton on 3/20/24.
//
// DetailView
// Image of genre, text of the genre on top of it
// Text of author, reivew, star rating
// Preview do/try/catch
// set Modeal config, container, create example book, return the view with example book and modelContainer

import SwiftData
import SwiftUI

struct DetailView: View {
    var book: Book
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre)
                        .resizable()
                        .scaledToFit()
                    Text(book.genre)
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.75))
                        .clipShape(.capsule)
                }
                Text(book.author)
                    .font(.title)
                Text(book.date.formatted(date: .abbreviated, time: .omitted))
                RatingView(rating: .constant(book.rating))
                    .font(.system(size: 20))
                    .padding(3)
                Text(book.review)
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle(book.title)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Sample Title", author: "A Person", genre: "Fantasy", review: "ipso lorem", rating: 3, date: .now)
        return DetailView(book: example)
            .modelContainer(container)

    } catch {
        return Text("Could not load preview \(error.localizedDescription)")
    }
}
