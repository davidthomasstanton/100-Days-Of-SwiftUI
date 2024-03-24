//
//  SwiftDataProject_4App.swift
//  SwiftDataProject_4
//
//  Created by David Stanton on 3/23/24.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProject_4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
