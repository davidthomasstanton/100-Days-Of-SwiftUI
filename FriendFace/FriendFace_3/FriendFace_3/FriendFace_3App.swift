//
//  FriendFace_3App.swift
//  FriendFace_3
//
//  Created by David Stanton on 3/28/24.
//
import SwiftData
import SwiftUI

@main
struct FriendFace_3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
