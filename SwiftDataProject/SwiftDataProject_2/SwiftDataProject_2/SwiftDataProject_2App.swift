//
//  SwiftDataProject_2App.swift
//  SwiftDataProject_2
//
//  Created by David Stanton on 3/22/24.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProject_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
