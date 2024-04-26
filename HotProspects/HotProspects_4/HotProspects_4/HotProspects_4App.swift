//
//  HotProspects_4App.swift
//  HotProspects_4
//
//  Created by David Stanton on 4/25/24.
//
import SwiftData
import SwiftUI

@main
struct HotProspects_4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
