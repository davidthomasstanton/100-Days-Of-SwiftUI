//
//  Book.swift
//  Bookworm
//
//  Created by David Stanton on 3/15/24.
//
import SwiftData
import Foundation

// Book model
// variables for title, author, genre, review, rating

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
