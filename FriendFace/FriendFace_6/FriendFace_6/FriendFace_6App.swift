//
//  FriendFace_6App.swift
//  FriendFace_6
//
//  Created by David Stanton on 3/30/24.
//
import SwiftData
import SwiftUI

@main
struct FriendFace_6App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
