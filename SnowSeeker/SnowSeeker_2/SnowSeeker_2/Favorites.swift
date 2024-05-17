//
//  Favorites.swift
//  SnowSeeker_2
//
//  Created by David Stanton on 5/16/24.
//

import SwiftUI

@Observable
class Favorites {
    private var favorites = Set<String>()
    private let key = "Favorites"
    
    init() {
        favorites = []
    }
    
    func save() {
        // more to come
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
}
