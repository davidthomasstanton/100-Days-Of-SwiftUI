//
//  ContentView.swift
//  Bookworm_1
//
//  Created by David Stanton on 3/15/24.
//
// Book model
// variables for title, author, genre, review, rating, date
// ContentView
// Property wrappers for modelContext, query for books, showingAddScreen
// Nav Stack with a List of books as Navlinks
// items in list have the EmojiRating, title and author, change if rating == 1
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
// DetailView
// Image of genre, text of the genre on top of it
// Text of author, reivew, star rating
// Preview do/try/catch
// set Modeal config, container, create example book, return the view with example book and modelContainer
// function to delete book with confirmation button and programmatic dismiss

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                NavigationLink(value: book) {
                    HStack {
                        EmojiRatingView(rating: book.rating)
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.largeTitle)
                                .foregroundStyle(book.rating == 1 ? .red : .black)
                                .opacity(book.rating == 1 ? 0.50 : 1.0)
                            Text(book.author)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .navigationDestination(for: Book.self) { book in
                    DetailView(book: book)
                }
            }
                .onDelete(perform: deleteBook)
            
        }
        .navigationTitle("Bookworm")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
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
    func deleteBook(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
