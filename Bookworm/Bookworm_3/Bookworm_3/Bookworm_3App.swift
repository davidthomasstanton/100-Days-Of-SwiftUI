//
//  Bookworm_3App.swift
//  Bookworm_3
//
//  Created by David Stanton on 3/16/24.
//
import SwiftData
import SwiftUI

@main
struct Bookworm_3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
