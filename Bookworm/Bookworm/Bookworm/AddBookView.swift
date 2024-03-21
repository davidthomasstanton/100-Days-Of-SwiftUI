//
//  AddBookView.swift
//  Bookworm
//
//  Created by David Stanton on 3/15/24.
//
import SwiftData
import SwiftUI

// AddBookView
// add modelContext, add dismiss
// Variables and fields to add title, author, genre, review, rating
// Button to add book, insert into modelContext, dismiss
// disabled save unless there is a title and author
// extension on string to check if String is reallyEmpty
struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Write a reivew") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                Section {
                    Button("Save") {
                        // add the book
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: .now)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(title.isReallyEmpty || author.isReallyEmpty)
            }
            .navigationTitle("Add Book")
        }
    }
}

extension String {
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    AddBookView()
}
