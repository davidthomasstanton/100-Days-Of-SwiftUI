//
//  ContentView.swift
//  DiceRoll_1
//
//  Created by David Stanton on 5/10/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    let diceIncrements: [Int] = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var increment = 100
    @State private var result: Int = 0
    @State private var isActive = false
    @State private var rollNum = 0
    @Query(sort: \Dice_1.rollNum) private var rolls: [Dice_1]
    var body: some View {
        VStack {
            Text("Dice-Roller \(increment)!")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.gray)
            
            Section {
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 15)
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 150, height: 150)
                            .foregroundColor(.gray.opacity(0.2))
                            .shadow(radius: 15)
                        Text(!isActive ? "_" : "\(result)")
                            .font(.system(size: 90))
                            .padding()

                    }
                }
                
                
                

                Button {
                    rollDice()
                } label: {
                    Text("ROLL DICE")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 7)
                        .background(.blue)
                        .clipShape(.capsule)
                }
                
                Picker("Dice Increment", selection: $increment) {
                    Text("d4").tag(diceIncrements[0])
                    Text("d6").tag(diceIncrements[1])
                    Text("d8").tag(diceIncrements[2])
                    Text("d10").tag(diceIncrements[3])
                    Text("d12").tag(diceIncrements[4])
                    Text("d20").tag(diceIncrements[5])
                    Text("d100").tag(diceIncrements[6])
                }
                .pickerStyle(.segmented)
            }
        }
        .padding()
        .toolbar {
            Button("Delete Rolls", systemImage: "minus.circle", action: deleteRolls)
        }
        
        VStack(alignment: .leading) {
//            Text("Previous Rolls")
//                .font(.subheadline)
//                .foregroundStyle(.secondary)
//                .padding()
            Section {
                List(rolls) { roll in
                    Text("Roll #\(roll.rollNum)  d\(roll.dieIncrement):\(roll.dieResult)")
                }
            }
        }
        .background(Color(.lightGray))
    }
    
    func rollDice() {
        isActive = false
        result = Int.random(in: 1...increment)
        isActive = true
        rollNum += 1
        let newRoll = Dice_1(rollNum: rollNum, dieIncrement: increment, dieResult: result)
        modelContext.insert(newRoll)
    }
    
    func deleteRolls() {
        
    }
}

#Preview {
    ContentView()
}
