//
//  Bookworm_2App.swift
//  Bookworm_2
//
//  Created by David Stanton on 3/15/24.
//
import SwiftData
import SwiftUI

@main
struct Bookworm_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
