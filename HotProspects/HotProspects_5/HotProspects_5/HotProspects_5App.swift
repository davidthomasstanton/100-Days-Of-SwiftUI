//
//  HotProspects_5App.swift
//  HotProspects_5
//
//  Created by David Stanton on 4/26/24.
//
import SwiftData
import SwiftUI

@main
struct HotProspects_5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
