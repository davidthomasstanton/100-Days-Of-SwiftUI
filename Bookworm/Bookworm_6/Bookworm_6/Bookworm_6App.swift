//
//  Bookworm_6App.swift
//  Bookworm_6
//
//  Created by David Stanton on 3/20/24.
//
import SwiftData
import SwiftUI

@main
struct Bookworm_6App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
