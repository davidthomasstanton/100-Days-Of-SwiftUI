//
//  FriendFace_2App.swift
//  FriendFace_2
//
//  Created by David Stanton on 3/28/24.
//
import SwiftData
import SwiftUI

@main
struct FriendFace_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
