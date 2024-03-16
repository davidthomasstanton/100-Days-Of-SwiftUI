//
//  Bookworm_1App.swift
//  Bookworm_1
//
//  Created by David Stanton on 3/15/24.
//
import SwiftData
import SwiftUI

@main
struct Bookworm_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
