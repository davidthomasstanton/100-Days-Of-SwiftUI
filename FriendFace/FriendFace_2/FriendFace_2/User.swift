//
//  User.swift
//  FriendFace_2
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

struct User: Identifiable, Codable, Hashable {
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
    
    static let exampleUser = User(id: UUID(), isActive: true, name: "The Dude", age: 300, company: "BigLEnterprises", email: "Cohen@gmail.com", address: "LA", about: "He Abides", registered: .now, tags: ["Yoga", "Bowling"], friends: [])
}

struct Friend: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
}
