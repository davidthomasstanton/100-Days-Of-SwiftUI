//
//  RPSPractice2.swift
//  RockPaperScissors
//
//  Created by David Stanton on 1/30/24.
//

import SwiftUI

struct RPSPractice2: View {
    
    let movesHand = ["✊", "✋", "✌️"]
    let movesEmoji = ["🪨", "📄", "✂️"]
    let totalQuestions = 3
    
    @State private var computerMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var currentQuestion = 0
    @State private var showingResult = false
    
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Computer throws")
                    .normalTextStyle()
                
                Text(movesEmoji[computerMove])
                    .modifier(extraLarge())
                
                Spacer()
                
                VStack {
                    if shouldWin {
                        Text("Which one wins?")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.green)
                    } else {
                        Text("Which one should lose?")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.red)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                
                HStack {
                    ForEach(0..<3) { element in
                        Button {
                            //
                            checkResult(for: element)
                            
                        } label: {
                            Text(movesHand[element])
                                .font(.system(size: 80))
                                .padding()
                                .background(.blue)
                                .clipShape(.circle)
                        }
                    }
                }
                
                Spacer()
                
                Text("Score: \(score)")
                    .normalTextStyle()
                
                Spacer()
                
            }
            .padding()
            .alert("Game Over", isPresented: $showingResult) {
                Button("Continue", action: resetGame)
            } message: {
                Text("Your score is \(score) / \(totalQuestions)")
            }
            
        }
    }
    
    func checkResult(for choice: Int) {
        let winningMoves = [2, 0, 1]
        var wonRound: Bool
        
        if shouldWin {
            if computerMove == winningMoves[choice] {
                wonRound = true
            } else {
                wonRound = false
            }
        } else {
            if computerMove == winningMoves[choice - 1] {
                wonRound = true
            } else {
                wonRound = false
            }
        }
        
        //
        if wonRound {
            score += 1
        } else {
            score -= 1
        }
        currentQuestion += 1
        
        if currentQuestion == totalQuestions {
            showingResult = true
        } else {
            resetRound()
        }
    }
    
    func resetRound() {
        computerMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
    
    func resetGame() {
        computerMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        score = 0
        currentQuestion = 0
    }
}

struct extraLarge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 100))
            .padding()
            .background(.blue)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct normalText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(.white)
    }
}

extension View {
    func normalTextStyle() -> some View {
        modifier(normalText())
    }
}
#Preview {
    RPSPractice2()
}
