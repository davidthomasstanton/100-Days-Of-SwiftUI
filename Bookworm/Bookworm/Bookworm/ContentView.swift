//
//  ContentView.swift
//  Bookworm
//
//  Created by David Stanton on 3/14/24.
//
// ContentView
// Property wrappers for modelContext, query for books, showingAddScreen
// Nav Stack with a List of books as Navlinks
// items in list have the EmojiRating, title and author
// toolbar with Button to add book
import SwiftData
import SwiftUI

struct ContentView: View {
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
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .navigationDestination(for: Book.self) { book in
                        DetailView(book: book)
                    }
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
