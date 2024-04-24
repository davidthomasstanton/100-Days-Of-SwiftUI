//
//  HotProspects_2App.swift
//  HotProspects_2
//
//  Created by David Stanton on 4/23/24.
//
import SwiftData
import SwiftUI

@main
struct HotProspects_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
