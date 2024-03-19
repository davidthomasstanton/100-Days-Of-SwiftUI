//
//  DetailView.swift
//  Bookworm_1
//
//  Created by David Stanton on 3/18/24.
//
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
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .padding(8)
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
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
        let example = Book(title: "Sample Title", author: "Sample Author", genre: "Fantasy", review: "Good?", rating: 3)
        return DetailView(book: example)
            .modelContainer(container)

    } catch {
        return Text("Failed to create preview \(error.localizedDescription)")
    }
}
