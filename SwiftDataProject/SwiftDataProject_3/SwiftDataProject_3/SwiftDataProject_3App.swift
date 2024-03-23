//
//  SwiftDataProject_3App.swift
//  SwiftDataProject_3
//
//  Created by David Stanton on 3/22/24.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProject_3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
