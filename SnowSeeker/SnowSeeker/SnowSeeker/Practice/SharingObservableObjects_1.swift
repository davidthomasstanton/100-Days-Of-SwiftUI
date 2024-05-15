//
//  SharingObservableObjects_1.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

@Observable
class Player_1 {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView_1: View {
    @Environment(Player_1.self) var player
    
    var body: some View {
        @Bindable var player = player
        Stepper("High Score: \(player.highScore)", value: $player.highScore)
    }
}

struct SharingObservableObjects_1: View {
    @State private var player = Player_1()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView_1()
        }
        .environment(player)
    }
}

#Preview {
    SharingObservableObjects_1()
}
