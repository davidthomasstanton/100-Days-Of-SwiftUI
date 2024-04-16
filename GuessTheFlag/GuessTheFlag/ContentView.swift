//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore: Bool = false
    @State private var gameOver: Bool = false
    @State private var scoreTitle = ""
    @State private var gameOverText = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe whie, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe whie, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe whie, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe whie, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe whie, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe is gold with crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var correctAnswers = 0
    @State private var questionNumber = 0
    @State private var selectedFlag = -1
    
    let totalQuestions = 7
    
    
    var body: some View {
        ZStack  {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack (spacing: 15) {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                        .foregroundStyle(.secondary)
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                    
                    VStack(spacing: 20) {
                        ForEach(0..<3) { number in
                            Button {
                                // Action
                                flagTapped(number)
                                
                            } label: {
                                Image(countries[number])
                                    .clipShape(.rect(cornerRadius: 20))
                                    .shadow(radius: 5)
                            }
                            .accessibilityLabel(labels[countries[number]], default: "Unknown Flag")
                            .rotation3DEffect(
                                .degrees(selectedFlag == number ? 360 : 0), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                            //.opacity(selectedFlag == -1 || selectedFlag == number ? 1 : 0.25)
                            .scaleEffect(selectedFlag == -1 || selectedFlag == number ? 1 : 0.25)
                            .saturation(selectedFlag == -1 || selectedFlag == number ? 1: 0)
                            .animation(.default, value: selectedFlag)
  
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(correctAnswers) / \(questionNumber)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Score: \(correctAnswers) / \(questionNumber)")
        }
        .alert(gameOverText, isPresented: $gameOver) {
            Button("New Game", action: resetGame)
        } message: {
            Text("")
        }
    }
    
    func flagTapped(_ number: Int) {
        questionNumber += 1
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            correctAnswers += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        if (questionNumber == totalQuestions) {
            gameOverText = """
                            Game Over!
                            Your score is \(correctAnswers) / \(totalQuestions)
                            """
            gameOver = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = -1
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        correctAnswers = 0
        questionNumber = 0
        selectedFlag = -1
        gameOver = false
    }
}

#Preview {
    ContentView()
}
