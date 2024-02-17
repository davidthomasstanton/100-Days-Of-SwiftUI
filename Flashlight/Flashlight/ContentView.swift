//
//  ContentView.swift
//  Flashlight
//
//  Created by David Stanton on 2/17/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(Game.self) var game
    var body: some View {
        ZStack {
            PlayingView()
                .disabled(game.state != .playing)
            
            if game.state == .menu {
                MenuView()
            } else if game.state == .gameOver {
                GameOverView()
            }

        }
    }
}

#Preview {
    ContentView()
        .environment(Game())
}
