//
//  PathStore.swift
//  Navigation
//
//  Created by David Stanton on 2/26/24.
//

import SwiftUI

@Observable
class PathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
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
            print("Failed to save navigation data")
        }
    }
}

@Observable
class NavPathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
            if let data = try? Data(contentsOf: savePath) {
                if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                    path = NavigationPath(decoded)
                    return
                }
            }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
