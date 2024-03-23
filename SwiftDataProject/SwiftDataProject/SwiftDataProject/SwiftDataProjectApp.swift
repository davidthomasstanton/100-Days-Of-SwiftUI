//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by David Stanton on 3/20/24.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            PredicateFilterView()
        }
        .modelContainer(for: User.self)
    }
}
