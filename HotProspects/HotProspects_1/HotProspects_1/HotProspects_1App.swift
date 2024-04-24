//
//  HotProspects_1App.swift
//  HotProspects_1
//
//  Created by David Stanton on 4/23/24.
//
import SwiftData
import SwiftUI

@main
struct HotProspects_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
