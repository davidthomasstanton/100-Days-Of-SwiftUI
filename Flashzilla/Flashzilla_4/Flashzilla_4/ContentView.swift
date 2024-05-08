//
//  ContentView.swift
//  Flashzilla_4
//
//  Created by David Stanton on 5/7/24.
//
// ContentView
// Background image that's decorative
// Time that counts down from 100 if scene is active
// Show all cards (enumerated) in a stack, not tappable or screen-read when not in front
// with an Animation, call function removeCard, passing in the offset and reinsert Bool
// if cards are empty, button to start again
// Button to add cards
// if sheet is presented, go to an initialized EditCards, and reset current cards
// func removeCard()
// guard that the index is greater than 0
// if it's reinserted, move the card to 0, otherwise, remove
// if cards are empty, scene is not active
// func resetCards()
// set time to 100, scene is active, loadData
// func loadData()
// load data from UserDefaults and decode, set cards to decoded
// extension of View, func called stacked()
// take in the total amount of cards and the position, return some view
// create an offset of the total minus the position
// return the offset of self with the y value being the offset * 10
import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: offset * 5, y: offset * 10)
    }
}
struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 100
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = false
    @State private var cards = [Card]()
    @State private var isShowingEditCards = false
    var body: some View {
        ZStack {
            Image(decorative: "background")
            VStack {
                Text("Time Remaining: \(timeRemaining)")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                ZStack {
                    ForEach(Array(cards.enumerated()), id: \.element) { item in
                        CardView(card: item.element) { reinsert in
                            withAnimation {
                                removeCards(at: item.offset, reinsert: reinsert)
                            }
                        }
                        .stacked(at: item.offset, in: cards.count)
                        .allowsHitTesting(item.offset == cards.count - 1)
                        .accessibilityHidden(item.offset < cards.count - 1)
                    }
                }
                
                if !isActive {
                    Button {
                        if !cards.isEmpty {
                            resetCards()
                        }
                    } label: {
                        Text("Begin Study")
                            .font(.largeTitle)
                            .foregroundStyle(.black)
                            .padding(20)
                            .background(.white.opacity(0.75))
                            .clipShape(.capsule)
                    }
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
                    if !cards.isEmpty {
                        isActive = true
                    } else {
                        isActive = false
                    }
                }
            }
            .sheet(isPresented: $isShowingEditCards, content: EditCardsView.init)
            .onAppear(perform: loadData)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        isShowingEditCards = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                            .padding()
                            .background(.black.opacity(0.75))
                            .clipShape(.circle)
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 30)
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .padding()
            
            VStack {
                
            }
        }
    }
    func removeCards(at index: Int, reinsert: Bool) {
        guard index > 0 else { return }
        
        if reinsert {
            cards.move(fromOffsets: IndexSet(integer: index), toOffset: 0)
        } else {
            cards.remove(at: index)
        }
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()
    }
}

#Preview {
    ContentView()
}
