//
//  ContentView.swift
//  DiceRoll_6
//
//  Created by David Stanton on 5/13/24.
//

import SwiftUI

struct ContentView: View {
    let diceTypes: [Int] = [4, 6, 8, 10, 12, 20, 100]
    @State private var diceType = 6
    @State private var diceNumber = 4
    @State private var currentResult = DiceResult(type: 0, number: 0)
    @State private var savedResults = [DiceResult]()
    let savedPath = URL.documentsDirectory.appending(path: "SavedPath.JSON")
    @State private var stoppedDice = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let columns: [GridItem] = [
        .init(.adaptive(minimum: 60))
    ]
    var body: some View {
        NavigationStack {
            Form {
                Section("Dice") {
                    Picker("Dice Type", selection: $diceType) {
                        ForEach(diceTypes, id: \.self) { type in
                            Text("d\(type)")
                        }
                    }
                    .pickerStyle(.segmented)
                    Stepper("Number of Dice: \(diceNumber)", value: $diceNumber, in: 1...20)
                    
                    Button("Roll dice!", action: rollDice)
                        .font(.headline)
                }
                
                Section("Rolls") {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<currentResult.rolls.count, id: \.self) { index in
                            Text(String(currentResult.rolls[index]))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundStyle(.black)
                                .background(.white)
                                .shadow(radius: 3)
                                .font(.headline)
                        }
                    }
                }
            }
            .disabled(stoppedDice < currentResult.rolls.count)
            .onReceive(timer) { _ in
                updateDice()
            }
            .onAppear(perform: load)
            .navigationTitle("DiceRoller_v6")
        }
    }
    
    func rollDice() {
        currentResult = DiceResult(type: diceType, number: diceNumber)
        stoppedDice = -7
    }
    
    func updateDice() {
        guard stoppedDice < currentResult.rolls.count else { return }
        
        for i in stoppedDice..<diceNumber {
            if i < 0 { continue }
            currentResult.rolls[i] = Int.random(in: 1...diceType)
        }
        
        stoppedDice += 1
        
        if stoppedDice == currentResult.rolls.count {
            savedResults.insert(currentResult, at: 0)
            save()
        }
    }
    
    func load() {
        if let data = try? Data(contentsOf: savedPath) {
            if let results = try? JSONDecoder().decode([DiceResult].self, from: data) {
                savedResults = results
            }
        }
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(savedResults) {
            try? data.write(to: savedPath, options: [.atomic, .completeFileProtection])
        }
    }
}

#Preview {
    ContentView()
}
