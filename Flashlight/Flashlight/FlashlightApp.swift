//
//  FlashlightApp.swift
//  Flashlight
//
//  Created by David Stanton on 2/17/24.
//

import SwiftUI

@main
struct FlashlightApp: App {
    @State private var game: Game
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
    
    init() {
        _game = State(initialValue: Game())
    }
}
