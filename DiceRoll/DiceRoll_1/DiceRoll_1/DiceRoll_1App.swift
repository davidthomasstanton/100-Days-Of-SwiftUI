//
//  DiceRoll_1App.swift
//  DiceRoll_1
//
//  Created by David Stanton on 5/10/24.
//
import SwiftData
import SwiftUI

@main
struct DiceRoll_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Dice_1.self)
    }
}
