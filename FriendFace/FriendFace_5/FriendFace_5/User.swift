//
//  User.swift
//  FriendFace_5
//
//  Created by David Stanton on 3/28/24.
//

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
    
    static let exampleUser = User(id: UUID(), isActive: true, name: "name", age: 21, company: "company", email: "email", address: "address", about: "About", registered: .now, tags: ["tag1", "tag2"], friends: [])
}

struct Friend: Codable, Identifiable, Hashable {
    let id: UUID
    var name: String
}
