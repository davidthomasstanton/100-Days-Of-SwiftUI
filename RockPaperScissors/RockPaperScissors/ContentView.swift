//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by David Stanton on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerChoice = 0
    @State private var playerGoal = Int.random(in: 0...1)
    @State private var opponentChoice = Int.random(in: 0...2)
    @State private var showingResult = false
    @State private var result: String = ""
    @State private var playerScore = 0
    @State private var currentQuestion = 0
    @State private var endingGame = false
    
    let winOrLose = ["win", "lose"]
    let rockPaperScissors = ["🪨", "📄", "✂️"]
    let totalQuestions = 3
    
    
    var body: some View {
        
        VStack {
            
            Text("Opponent throws...")
                .font(.headline)
            
            Text(rockPaperScissors[opponentChoice])
                .iconStyled()
            
            HStack {
                Text("Choose a response in order to:")
                Text("\(winOrLose[playerGoal])")
                    .font(.title)
                    .italic()
                    .bold()
            }
            .font(.headline)
            
            
            HStack {
                ForEach(0..<3) { element in
                    Button {
                        iconTapped(of: element)
                    } label: {
                        Text(rockPaperScissors[element])
                            .iconStyled()
                    }
                }
            }
            //Text("Player chose \(rockPaperScissors[playerChoice])")
            

        }
        .padding()
        .alert(result, isPresented: $showingResult) {
            Button("Continue", action: reThrow)
        } message: {
            Text("")
        }
        .alert(result, isPresented: $endingGame) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Score: \(playerScore) / \(totalQuestions)")
        }
        
    }
    
    func iconTapped(of choice: Int) {
        print("Player choice: \(choice), opponent choice: \(opponentChoice)")
        if winOrLose[playerGoal] == "win" {
            switch (choice, opponentChoice) {
            case (0, 2) :
                result = "Correct! \(rockPaperScissors[choice]) beats \(rockPaperScissors[opponentChoice])"
                playerScore += 1
            case (1, 0) :
                result = "Correct! \(rockPaperScissors[choice]) beats \(rockPaperScissors[opponentChoice])"
                playerScore += 1
            case (2, 1) :
                result = "Correct! \(rockPaperScissors[choice]) beats \(rockPaperScissors[opponentChoice])"
                playerScore += 1
            default:
                result = "Wrong"
            }
        } else {
            switch (choice, opponentChoice) {
            case (0, 1) :
                result = "Correct! \(rockPaperScissors[choice]) loses to \(rockPaperScissors[opponentChoice])"
                playerScore += 1
            case (1, 2) :
                result = "Correct! \(rockPaperScissors[choice]) loses to \(rockPaperScissors[opponentChoice])"
                playerScore += 1
            case (2, 0) :
                result = "Correct! \(rockPaperScissors[choice]) loses to \(rockPaperScissors[opponentChoice])"
                playerScore += 1
            default:
                result = "Wrong"
            }
        }
        
        if currentQuestion == totalQuestions - 1 {
            endingGame = true
        } else {
            showingResult = true
        }
    }
    
    func reThrow() {
        playerGoal = Int.random(in: 0...1)
        opponentChoice = Int.random(in: 0...2)
        showingResult = false
        currentQuestion += 1
    }
    
    func resetGame() {
        playerGoal = Int.random(in: 0...1)
        opponentChoice = Int.random(in: 0...2)
        showingResult = false
        currentQuestion = 0
        playerScore = 0
        endingGame = false
    }
}


struct iconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("", size: 100))
    }
}

extension View {
    func iconStyled() -> some View {
        modifier(iconStyle())
    }
}


#Preview {
    ContentView()
}
