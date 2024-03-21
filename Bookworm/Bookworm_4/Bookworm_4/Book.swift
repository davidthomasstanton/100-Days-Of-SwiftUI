//
//  Book.swift
//  Bookworm_4
//
//  Created by David Stanton on 3/19/24.
//
// Book model
// variables for title, author, genre, review, rating
import SwiftData
import Foundation

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }
}
