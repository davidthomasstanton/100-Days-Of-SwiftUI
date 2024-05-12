//
//  ContentView.swift
//  DiceRoll_4
//
//  Created by David Stanton on 5/11/24.
//

import SwiftUI

struct ContentView: View {
    let diceTypes = [4, 6, 8, 10, 12, 20, 100]
    @AppStorage("typeOfDice") var typeOfDice = 6
    @AppStorage("numberOfDice") var numberOfDice = 4
    @State private var stoppedDice = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var currentResult = DiceResult(number: 0, type: 0)
    var columns: [GridItem] = [
        .init(.adaptive(minimum: 60))
    ]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Types of Dice", selection: $typeOfDice) {
                        ForEach(diceTypes, id: \.self) { type in
                            Text("d\(type)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Stepper("Number of Dice: \(numberOfDice)", value: $numberOfDice, in: 1...20)
                    
                    Button("Roll 'em!", action: rollDice)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(0..<currentResult.rolls.count, id: \.self) { roll in
                            Text(String(currentResult.rolls[roll]))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .foregroundStyle(.black)
                                .background(.white)
                                .shadow(radius: 3)
                                .font(.title)
                        }
                    }
                }
                .disabled(stoppedDice > currentResult.rolls.count)
            }
            .navigationTitle("Dice Roller!")
            .onReceive(timer) { _ in
                updateDice()
            }
        }
    }
    
    func rollDice() {
        currentResult = DiceResult(number: numberOfDice, type: typeOfDice)
        stoppedDice = -10
    }
    
    func updateDice() {
        guard stoppedDice < currentResult.rolls.count else { return }
        
        for i in stoppedDice..<numberOfDice {
            if i < 0 { continue }
            currentResult.rolls[i] = Int.random(in: 1...typeOfDice)
        }
        
        stoppedDice += 1
    }
}

#Preview {
    ContentView()
}
