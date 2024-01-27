//
//  GuessTheFlag_Practice.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/25/24.
//

import SwiftUI

struct GuessTheFlag_Practice: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var verdict = ""
    @State private var showContinue = false
    @State private var showGameOver = false
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var correctAnswers = 0
    @State private var questionNumber = 0
    
    let totalQuestions = 3
    
    let topColor = Color(red: 0.2, green: 0.3, blue: 0.4, opacity: 0.9)
    let bottomColor = Color(red: 0.3, green: 0.4, blue: 0.5, opacity: 0.9)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: topColor, location: 0.3),
                .init(color: bottomColor, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 600)
            .ignoresSafeArea()

            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack (spacing: 15) {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.bold())
                    
                    ForEach(0..<3) { number in
                        Button {
                            //
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                        }
                    }
                    
                    Text("Score: \(correctAnswers) / \(questionNumber)")
                        .font(.subheadline.italic())
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 15))
                
                Spacer()
                Spacer()
            }
            .padding(20)
        }
        .alert(verdict, isPresented: $showContinue) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Score: \(correctAnswers) / \(questionNumber)")
        }
        .alert(verdict, isPresented: $showGameOver) {
            Button("New Game", action: resetGame)
        }
    }
    
    func flagTapped(_ number: Int) {
        questionNumber += 1
        
        if number == correctAnswer {
            correctAnswers += 1
            verdict = "Correct"
        } else {
            verdict = "Wrong"
        }
        
        if questionNumber == totalQuestions {
            verdict = "Game Over!\nScore: \(correctAnswers) / \(totalQuestions)"
            showGameOver = true
        } else {
            showContinue = true
        }
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        correctAnswers = 0
        questionNumber = 0
    }
}

#Preview {
    GuessTheFlag_Practice()
}
