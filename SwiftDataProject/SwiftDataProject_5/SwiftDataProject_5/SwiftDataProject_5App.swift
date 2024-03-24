//
//  SwiftDataProject_5App.swift
//  SwiftDataProject_5
//
//  Created by David Stanton on 3/23/24.
//

import SwiftUI

@main
struct SwiftDataProject_5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
