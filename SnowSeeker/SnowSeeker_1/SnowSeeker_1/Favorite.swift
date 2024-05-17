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
        favorites = []
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
        // more to come
    }
}
