//
//  ContentView.swift
//  Bookworm_1
//
//  Created by David Stanton on 3/15/24.
//
// Book model
// variables for title, author, genre, review, rating
// ContentView
// Property wrappers for modelContext, query for books, showingAddScreen
// Nav Stack with a List of books as Navlinks
// items in list have the EmojiRating, title and author
// toolbar with Button to add book
// AddBookView
// add modelContext, add dismiss
// Variables and fields to add title, author, genre, review, rating
// Button to add book, insert into modelContext, dismiss
// let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
// Rating View
// variables for rating (binded), maximumRating, offImage, onImage, offColor, onColor
// HStack that displays the label if it's not empty
// Go through the rating, 1->max rating (+1) and place a Button that sends back the number tapped, and displays the onColor if the star is equal or more than the number tapped
// function that sends an offImage in place of the onImage if it's number is higher than the rating
// EmojiRatingView
// switch that returns Emojis that correspond to the rating

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List(books) { book in
                NavigationLink(value: book) {
                    HStack {
                        EmojiRatingView(rating: book.rating)
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.largeTitle)
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .navigationDestination(for: Book.self) { book in
                    DetailView(book: book)
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
