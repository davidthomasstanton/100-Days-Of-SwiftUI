//
//  ContentView.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
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
        return self.offset(y: offset * 10)
    }
}
struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @State private var cards = DataManager.load()
    @State private var showingEditScreen = false
    
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Time is \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                ZStack {
                    ForEach(Array(cards.enumerated()), id: \.element) { item in
                        CardView(card: item.element) { reinsert in
                            withAnimation {
                                removeCard(at: item.offset, reinsert: reinsert)
                            }
                        }
                        .stacked(at: item.offset, in: cards.count)
                        .allowsHitTesting(item.offset == cards.count - 1)
                        .accessibilityHidden(item.offset < cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
            }
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Button {
                        showingEditScreen.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1, reinsert: true)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1, reinsert: false)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
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
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
//        .onAppear(perform: resetCards)
    }
    
    func removeCard(at index: Int, reinsert: Bool) {
        guard index >= 0 else { return }
        
        if reinsert {
            cards.move(fromOffsets: IndexSet(integer: index), toOffset: 0)
        } else {
            cards.remove(at: index)
        }
        
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        cards = DataManager.load()
    }
    
//    func loadData() {
//        if let data = UserDefaults.standard.data(forKey: "Cards") {
//            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
//                cards = decoded
//            }
//        }
//    }
}

#Preview {
    ContentView()
}
