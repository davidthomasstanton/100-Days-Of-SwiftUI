//
//  Bookworm_5App.swift
//  Bookworm_5
//
//  Created by David Stanton on 3/20/24.
//
import SwiftData
import SwiftUI

@main
struct Bookworm_5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
