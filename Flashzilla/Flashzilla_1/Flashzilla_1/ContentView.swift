//
//  ContentView.swift
//  Flashzilla_1
//
//  Created by David Stanton on 5/1/24.
//

import SwiftUI

extension View {
    func stacked(at position: Int, total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: offset * 2, y: offset * 8)
    }
}
struct ContentView: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<cards.count) { index in
                        CardView(card: cards[index])
                            .stacked(at: index, total: 10)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
