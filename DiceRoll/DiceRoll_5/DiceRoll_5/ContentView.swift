//
//  ContentView.swift
//  DiceRoll_5
//
//  Created by David Stanton on 5/13/24.
//

import SwiftUI

struct ContentView: View {
    let diceTypes = [4, 6, 8, 10, 12, 20, 100]
    @State private var currentResult = DiceResult(number: 0, type: 0)
    @State private var diceNumber: Int = 4
    @State private var diceType: Int = 6
    @State private var stoppedDice = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let savedPath = URL.documentsDirectory.appending(path: "SavedPath.JSON")
    @State private var savedResults = [DiceResult]()
    
    let columns: [GridItem] = [.init(.adaptive(minimum: 60))]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Dice Type & Number") {
                    Picker("Dice Type", selection: $diceType) {
                        ForEach(diceTypes, id: \.self) { type in
                            Text("d\(type)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Stepper("Number of Dice: \(diceNumber)", value: $diceNumber, in: 1...20)
                    
                    Button("Roll Dice!", action: rollDice)
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
                                .font(.title)
                        }
                    }
                }
                .disabled(stoppedDice < currentResult.rolls.count)
                
                if savedResults.isEmpty == false {
                    Section("Previous Results") {
                        ForEach(savedResults, id: \.self) { result in
                            VStack(alignment: .leading) {
                                Text("Rolled: \(result.number) d\(result.type)")
                                    .font(.headline)
                                Text("Rolls:    \(result.description)")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Dice Roller v5")
            .onReceive(timer) { _ in
                updateDice()
            }
            .onAppear(perform: load)
        }
    }
    
    func rollDice() {
        currentResult = DiceResult(number: diceNumber, type: diceType)
        stoppedDice = -10
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
