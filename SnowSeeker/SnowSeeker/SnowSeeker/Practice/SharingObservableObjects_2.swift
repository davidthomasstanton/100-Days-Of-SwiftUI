//
//  SharingObservableObjects_2.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

@Observable
class Player_2 {
    var name = "Kipper"
    var highScore = 0
}

struct HighScoreView_2: View {
    @Environment(Player_2.self) var player
    
    var body: some View {
        @Bindable var player = player
        Stepper("Mice Caught: \(player.highScore)", value: $player.highScore)
    }
}
struct SharingObservableObjects_2: View {
    @State private var player = Player_2()
    
    var body: some View {
        VStack {
            Text("Welcome \(player.name)!")
            HighScoreView_2()
        }
        .environment(player)
    }
}

#Preview {
    SharingObservableObjects_2()
}
