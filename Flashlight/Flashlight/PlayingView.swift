//
//  PlayingView.swift
//  Flashlight
//
//  Created by David Stanton on 2/17/24.
//

import SwiftUI

struct PlayingView: View {
    @Environment(Game.self) var game
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    var body: some View {
        Grid(horizontalSpacing: 2, verticalSpacing: 2) {
            ForEach(0..<game.rowCount, id: \.self) { row in
                GridRow {
                    ForEach(0..<game.colCount, id: \.self) { col in
                        Button {
                            game.press(row, col)
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(game.rows[row][col].color)
                                
                                if accessibilityDifferentiateWithoutColor {
                                    Image(systemName: game.rows[row][col].symbol)
                                        .font(.largeTitle)
                                        .foregroundStyle(.black)
                                        .dynamicTypeSize(...DynamicTypeSize.large)
                                }
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    PlayingView()
        .environment(Game())
}
