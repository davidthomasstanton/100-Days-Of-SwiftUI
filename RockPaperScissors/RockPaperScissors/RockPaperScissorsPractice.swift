//
//  RockPaperScissorsPractice.swift
//  RockPaperScissors
//
//  Created by David Stanton on 1/29/24.
//

import SwiftUI

struct RockPaperScissorsPractice: View {
    
    @State private var opponentChoice = Int.random(in: 0...2)
    @State private var goal = Int.random(in: 0...1)
    @State private var playerChoice = 0
    @State private var score = 0
    @State private var currentQuestion = 0
    @State private var showingRoundResult = false
    @State private var showingFinalResult = false
    @State private var roundResult = ""
    
    let totalQuestions = 5
    let playerObjectives = ["WIN", "LOSE"]
    let rockPaperScissors = ["🪨", "📄", "✂️"]
    let topColor = Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.9)
    let bottomColor = Color(red: 0.6, green: 0.5, blue: 0.7, opacity: 0.9)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: topColor, location: 0.3),
                .init(color: bottomColor, location: 0.32)
                ],center: .top, startRadius: 265, endRadius: 600)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Opponent throws: ")
                    .font(.headline)
                Text(rockPaperScissors[opponentChoice])
                    .iconExtraLargeStyle()
                
                Spacer()
                
                VStack {
                    Text("Your objective: ")
                        .font(.headline)
                    Text(playerObjectives[goal])
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .italic()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(topColor)
                //Spacer()
                
                HStack {
                    ForEach(0..<3) { element in
                        Button() {
                            playerChoice = element
                            checkResult(throw: playerChoice)
                        } label: {
                            Text(rockPaperScissors[element])
                                .iconLargeStyle()
                        }
                    }
                }
                Spacer()
                
                Text("Round \(currentQuestion) / \(totalQuestions)")
                    .italic()
                Spacer()
            }
            .padding()
            .alert(roundResult, isPresented: $showingRoundResult) {
                Button("Continue", action: reThrow)
            } message: {
                Text("")
            }
            .alert(roundResult, isPresented: $showingFinalResult) {
                Button("Restart", action: restartGame)
            } message: {
                if (score == totalQuestions) {
                    Text("\nCONGRATULATIONS!\nYou got 'em all right!")
                } else if score == 0 {
                    Text("Wow...none right.\nThat is hard to do.")
                } else {
                    Text("Player score: \(score) / \(totalQuestions)") }
                
            }
        }
        
    }
    
    func checkResult(throw: Int) {
        if playerChoice == opponentChoice {
            roundResult = "Incorrect, result is a DRAW"
        } else if playerObjectives[goal] == "WIN" {
            if (playerChoice == 0 && opponentChoice == 2) ||
                (playerChoice == 1 && opponentChoice == 0) ||
                (playerChoice == 2 && opponentChoice == 1) {
                score += 1
                roundResult = "Correct! \(rockPaperScissors[playerChoice]) beats \(rockPaperScissors[opponentChoice])"
            } else {
                roundResult = "Incorrect, \(rockPaperScissors[playerChoice]) loses to \(rockPaperScissors[opponentChoice])"
            }
        } else if playerObjectives[goal] == "LOSE" {
            if (playerChoice == 0 && opponentChoice == 1) ||
                (playerChoice == 1 && opponentChoice == 2) ||
                (playerChoice == 2 && opponentChoice == 0) {
                score += 1
                roundResult = "Correct! \(rockPaperScissors[playerChoice]) loses to \(rockPaperScissors[opponentChoice])"
            } else {
                roundResult = "Incorrect, \(rockPaperScissors[playerChoice]) beats \(rockPaperScissors[opponentChoice])"
            }
        }
        if currentQuestion == (totalQuestions - 1) {
            currentQuestion += 1
            showingFinalResult = true
        } else {
            showingRoundResult = true
        }
    }
    
    func reThrow() {
        opponentChoice = Int.random(in: 0...2)
        goal = Int.random(in: 0...1)
        currentQuestion += 1
        showingRoundResult = false
    }
    
    func restartGame() {
        opponentChoice = Int.random(in: 0...2)
        goal = Int.random(in: 0...1)
        score = 0
        currentQuestion = 0
        showingRoundResult = false
        showingFinalResult = false
        roundResult = ""
    }
}



struct iconLarge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("", size: 70))
            .padding(20)
            .background(.blue)
            .clipShape(.circle)
            .shadow(radius: 07)
    }
}

extension View {
    func iconLargeStyle() -> some View {
        modifier(iconLarge())
    }
}

struct iconExtraLarge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("", size: 100))
            .padding(40)
            .background(.black)
            .clipShape(.circle)
    }
}

extension View {
    func iconExtraLargeStyle() -> some View {
        modifier(iconExtraLarge())
    }
}

#Preview {
    RockPaperScissorsPractice()
}
