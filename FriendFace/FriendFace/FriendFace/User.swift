//
//  User.swift
//  FriendFace
//
//  Created by David Stanton on 3/27/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: Friends
    
    static let exampleName = "Fred Flinstone"
    static let exampleIsActive = "False"
}

struct Friends: Codable {
    let id: String
    let name: String
}
