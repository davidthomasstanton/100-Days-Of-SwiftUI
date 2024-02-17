//
//  MenuView.swift
//  Flashlight
//
//  Created by David Stanton on 2/17/24.
//

import SwiftUI

struct MenuView: View {
    @Environment(Game.self) var game
    var body: some View {
        VStack {
            Text("FLASHLIGHT")
                .font(.largeTitle)
            
            Button("New Game") {
                withAnimation {
                    game.restart()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 20))
    }
}

#Preview {
    MenuView()
        .environment(Game())
}
