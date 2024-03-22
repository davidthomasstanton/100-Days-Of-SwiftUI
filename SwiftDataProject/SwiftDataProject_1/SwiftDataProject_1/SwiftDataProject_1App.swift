//
//  SwiftDataProject_1App.swift
//  SwiftDataProject_1
//
//  Created by David Stanton on 3/21/24.
//

import SwiftUI

@main
struct SwiftDataProject_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
