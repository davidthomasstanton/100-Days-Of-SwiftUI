//
//  TeacherSolution.swift
//  RockPaperScissors
//
//  Created by David Stanton on 1/30/24.
//

import SwiftUI

struct TeacherSolution: View {
    
    let moves = ["✊", "✋", "✌️"]
    
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Computer has played...")
                .font(.headline)
            
            Text(moves[computerChoice])
                .font(.system(size: 200))
            
            if shouldWin {
                Text("Which one wins?")
                    .foregroundStyle(.green)
                font(.title)
                
            } else {
                Text("Whicn one loses?")
                    .foregroundStyle(.red)
                    .font(.title)
            }
            
            HStack {
                ForEach(0..<3) { number in
                    Button(moves[number]) {
                        // handle move tap
                        play(choice: number)
                    }
                    .font(.system(size: 80))
                }
            }
            
            Spacer()
            
            Text("Score: \(score)")
                .font(.subheadline)
            
            Spacer()
        }
        .alert("Game over", isPresented: $showingResults) {
            Button("Play Again", action: reset)
        } message: {
            Text("Your score was \(score)")
        }
    }
    
    func play(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[computerChoice]
        } else {
            // we should lose
            didWin = winningMoves[choice] == computerChoice
        }
        
        // more code to come
        if didWin {
            score += 1
        } else {
            score -= 1
        }
        
        if questionCount == 1 {
            showingResults = true
        } else {
            computerChoice = Int.random(in: 0..<3)
            shouldWin = Bool.random()
            questionCount += 1
        }
    }
    
    func reset() {
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionCount = 1
        score = 0
    }
    
}


#Preview {
    TeacherSolution()
}
