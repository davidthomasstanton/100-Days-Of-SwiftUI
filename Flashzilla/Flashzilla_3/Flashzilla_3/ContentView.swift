//
//  ContentView.swift
//  Flashzilla_3
//
//  Created by David Stanton on 5/2/24.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: offset * 4, y: offset * 4)
    }
}
struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 100
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            Image(.background)
                .opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                Text("Time Remaining: \(timeRemaining)")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 20)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                            withAnimation {
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                    }
                }
                .padding()
            }
            if accessibilityDifferentiateWithoutColor {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "xmark.circle")
                            .background(.black.opacity(6.0))
                            .clipShape(.circle)
                            .padding()
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .background(.black.opacity(6.0))
                            .clipShape(.circle)
                            .padding()
                    }
                    .padding()
                }
                .foregroundStyle(.white)
                .font(.system(size: 90))
                .padding()
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                isActive = true
            } else {
                isActive = false
            }
        }
        
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

#Preview {
    ContentView()
}
