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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
