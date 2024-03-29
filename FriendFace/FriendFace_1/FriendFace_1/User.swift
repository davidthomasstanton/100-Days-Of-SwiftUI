//
//  User.swift
//  FriendFace_1
//
//  Created by David Stanton on 3/28/24.
//
// ==== User ====
// struct that is Codable, Identifiable, Hashable
// variables for each field of the JSON
// create exampleUser
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
    
    static let exampleUser = User(id: UUID(), isActive: true, name: "The Dude", age: 44, company: "WholeBean", email: "TheDudeAbides@gmail.com", address: "648 Privot Lane", about: "Sometimes you eat the bar, sometimes the bar eats you.", registered: .now, tags: ["Bowling", "White Russians"], friends: [])
}

struct Friend: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
}
