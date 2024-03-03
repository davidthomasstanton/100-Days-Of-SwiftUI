//
//  PathStore_1.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

@Observable
class PathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save")
        }
    }
}
