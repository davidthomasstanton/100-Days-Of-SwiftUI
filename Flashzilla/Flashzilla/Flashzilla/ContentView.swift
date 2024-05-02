//
//  ContentView.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI
// extension of View, func called stacked()
// take in the total amount of cards and the position, return some view
// create an offset of the total minus the position
// return the offset of self with the y value being the offset * 10
extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}
struct ContentView: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index])
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
    

}

#Preview {
    ContentView()
}
