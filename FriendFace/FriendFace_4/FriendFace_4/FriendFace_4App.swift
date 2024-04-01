//
//  FriendFace_4App.swift
//  FriendFace_4
//
//  Created by David Stanton on 3/28/24.
//
import SwiftData
import SwiftUI

@main
struct FriendFace_4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
