//
//  ContentView.swift
//  DiceRoll_3
//
//  Created by David Stanton on 5/11/24.
//

import SwiftUI

struct ContentView: View {
    let diceTypes = [4, 6, 8, 10, 12, 20, 100]
    @AppStorage("selectedDiceType") var selectedDiceType = 6
    @AppStorage("numberToRoll") var numberToRoll = 4
    @State private var currentRoll = DiceResult(type: 0, number: 0)
    let columns: [GridItem] = [
        .init(.adaptive(minimum: 60))
    ]
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var stoppedDice = 0
    
    // save as URL
    let savedPath = URL.documentsDirectory.appending(path: "SavedResults.JSON")
    @State private var savedResults = [DiceResult]()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("Dice Type")
                            .foregroundStyle(.secondary)
                        Picker("Dice Type", selection: $selectedDiceType) {
                            ForEach(diceTypes, id: \.self) { type in
                                Text("d\(type)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Stepper("Number of Dice: \(numberToRoll)", value: $numberToRoll)
                    
                    Button("Roll Dice!", action: rollDice)
                    
                } footer: {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<currentRoll.rolls.count, id: \.self) { roll in
                            Text(String(currentRoll.rolls[roll]))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundStyle(.black)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 3)
                                .font(.title)
                                .padding(5)
                        }
                    }
                }
                
                if savedResults.isEmpty == false {
                    Section("Previous Results") {
                        ForEach(savedResults) { result in
                            VStack(alignment: .leading) {
                                Text("Rolled \(result.number) x d\(result.type)")
                                    .font(.headline)
                                Text(result.rolls.map(String.init).joined(separator: ", "))
                            }
                        }
                    }
                }
            }
            .disabled(stoppedDice < currentRoll.rolls.count)
        }
        .navigationTitle("Dice Roller 2000!")
        .onReceive(timer) { _ in
            updateDice()
        }
        .onAppear(perform: load)
    }
    
    func rollDice() {
        currentRoll = DiceResult(type: selectedDiceType, number: numberToRoll)
        stoppedDice = -10
    }
    
    func updateDice() {
        guard stoppedDice < currentRoll.rolls.count else { return }
        
        for i in stoppedDice..<numberToRoll {
            if i < 0 { continue }
            currentRoll.rolls[i] = Int.random(in: 1...selectedDiceType)
        }
        stoppedDice += 1
        
        if stoppedDice == currentRoll.rolls.count {
            savedResults.insert(currentRoll, at: 0)
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
