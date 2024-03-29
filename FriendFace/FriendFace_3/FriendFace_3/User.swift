//
//  User.swift
//  FriendFace_3
//
//  Created by David Stanton on 3/28/24.
//
// ==== User ====
// struct that is Codable, Identifiable, Hashable
// variables for each field of the JSON
// create exampleUser
// ==== Friend ====
// struct that creates var for id and name
import Foundation

struct User: Codable, Hashable, Identifiable {
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
    
    static let exampleUser = User(id: UUID(), isActive: true, name: "Name", age: 12, company: "company", email: "email", address: "Address", about: "Stuff", registered: .now, tags: ["tag1", "tag2"], friends: [])
}

struct Friend: Codable, Hashable, Identifiable {
    let id: UUID
    var name: String
}
