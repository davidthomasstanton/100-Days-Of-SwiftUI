//
//  User.swift
//  FriendFace
//
//  Created by David Stanton on 3/27/24.
//
// ==== User ====
// struct that is Codable, Identifiable, Hashable
// variables for each field of the JSON
// create exampleUser
import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static let exampleUser = User(id: UUID(), isActive: true, name: "Paul Hudson", age: 43, company: "Two Straws Industries", email: "paul@hackingwithswift.com", address: "555, Taylor Swift Dr", about: "Paul writes about Swift and dog-related topics", registered: .now, tags: ["swiftUI", "dogs"], friends: [])
    
}
