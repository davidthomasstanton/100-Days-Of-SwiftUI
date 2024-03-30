//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by David Stanton on 3/27/24.
//
import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
