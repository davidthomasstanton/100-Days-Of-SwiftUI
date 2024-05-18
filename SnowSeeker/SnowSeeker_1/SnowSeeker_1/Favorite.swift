//
//  Favorite.swift
//  SnowSeeker_1
//
//  Created by David Stanton on 5/16/24.
//

import SwiftUI

@Observable
class Favorite {
    private var favorites = Set<String>()
    
    private var key = "Favorites"
    
    init() {
        let url = URL.documentsDirectory.appending(path: key)
        if let data = try? Data(contentsOf: url) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                favorites = decoded
            }
        } else {
            favorites = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        favorites.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        favorites.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        favorites.remove(resort.id)
        save()
    }
    
    func save() {
        let url = URL.documentsDirectory.appending(path: key)
        if let data = try? JSONEncoder().encode(favorites) {
            try? data.write(to: url, options: [.atomic, .completeFileProtection])
        }
    }
}
