//
//  Friend.swift
//  FriendFace
//
//  Created by David Stanton on 3/28/24.
//
// ==== Friend ====
// struct that creates var for id and name
import Foundation

struct Friend: Hashable, Identifiable, Codable {
    let id: UUID
    var name: String
    
    static let exampleFriend = Friend(id: UUID(), name: "David Stanton")
}
