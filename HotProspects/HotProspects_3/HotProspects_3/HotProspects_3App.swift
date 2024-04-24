//
//  HotProspects_3App.swift
//  HotProspects_3
//
//  Created by David Stanton on 4/23/24.
//
import SwiftData
import SwiftUI

@main
struct HotProspects_3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
