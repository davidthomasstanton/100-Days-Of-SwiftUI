//
//  Bookworm_4App.swift
//  Bookworm_4
//
//  Created by David Stanton on 3/19/24.
//
import SwiftData
import SwiftUI

@main
struct Bookworm_4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
