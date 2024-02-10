//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by David Stanton on 2/8/24.
//

import SwiftUI

// Player selects the multiplication tables to practice
// Player selects the number of questions


struct ContentView: View {
    
    @State private var mNumber: Int = 0
    @State private var minX: Int = 0
    @State private var maxX: Int = 0
    @State private var numOfQuestions = 0
    @State private var questions: [Int] = [0]
    @State private var gameOn = false
    @State private var currentQ = 1
    @State private var userEntry = [0]
    @State private var userAnswer = 0
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    @State private var showingMessage = false
    @State private var showingEndOfGame = false
    @State private var playerScore = 0
    
    let numOfQuestionsArray: [Int] = [1, 3, 5]
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Multiplication Practice")
                    .font(.title)
                Button {
                    startGame()
                } label: {
                    Text("Begin")
                        .frame(width: 200, height: 40)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 20))
                }
                
                
                List {
                    Picker("Number to multiply", selection: $mNumber) {
                        ForEach(1..<13, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    HStack {
                        Picker("From", selection: $minX) {
                            ForEach(1..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("To", selection: $maxX) {
                            ForEach(1..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                    Picker("Number of Questions", selection: $numOfQuestions) {
                        ForEach(numOfQuestionsArray, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                .padding(20)
                
                ZStack {

                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(gameOn ? .white : .clear)
                        .clipShape(.rect(cornerRadius: 20))
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        HStack {
                            Text("Question #\(currentQ):")
                                .font(.system(size: 20))
                                .foregroundStyle(gameOn ? .black : .clear)
                                .animation(.default)
                            Text(displayQuestion())
                                .font(.system(size: 20))
                                .foregroundStyle(gameOn ? .black : .clear)
                                .animation(.easeIn(duration: 0.5))
                                .bold()
                            
                            //.foregroundStyle(.black)
                        }
                        
                        Text("\(userAnswer)")
                            .foregroundStyle(gameOn ? .black : .clear)
                            .animation(gameOn ? nil : .default)
                        
                        HStack {
                            ForEach(1..<4) { num in
                                Button {
                                    addNumber(num)
                                } label: {
                                    Text("\(num)")
                                        .calculatorButtonStyle()
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(4..<7) { num in
                                Button {
                                    addNumber(num)
                                } label: {
                                    Text("\(num)")
                                        .calculatorButtonStyle()
                                }
                            }
                        }
                        
                        HStack {
                            ForEach(7..<10) { num in
                                Button {
                                    addNumber(num)
                                } label: {
                                    Text("\(num)")
                                        .calculatorButtonStyle()
                                }
                            }
                        }
                        
                        HStack {
                            Button() {
                                userAnswer = 0
                                userEntry.removeAll()
                            } label: {
                                Text("Clear")
                                    .calculatorButtonStyle()
                            }
                            
                            Button {
                                addNumber(0)
                            } label: {
                                Text("0")
                                    .calculatorButtonStyle()
                            }
                            
                            Button {
                                checkAnswer()
                            } label: {
                                Text("Enter")
                                    .calculatorButtonStyle()
                            }
                        }
                        
                    }
                    
                    
                    
                }
                .padding()
            }
            
            
        }
        .onAppear(perform: setup)
        .alert(resultTitle, isPresented: $showingMessage) {
            Button("Next") {
                nextQuestion()
            }
        } message: {
            Text(resultMessage)
        }
        .alert("Practice Complete!", isPresented: $showingEndOfGame) {
            Button("Restart") { 
                restartGame()
            }
        } message: {
            Text("You got \(playerScore) of \(numOfQuestions)")
        }
    }
        
    
    func setup() {
        mNumber = Int.random(in: 1..<13)
        minX = Int.random(in: 1..<13)
        maxX = Int.random(in: minX..<13)
        numOfQuestions = numOfQuestionsArray[Int.random(in: 0...2)]
    }
    
    func restartGame() {
        gameOn = false
        
    }
    
    func startGame() {
        var min = minX <= maxX ? minX : maxX
        var max = maxX >= minX ? maxX : minX
        
        currentQ = 1
        questions.removeAll()
        for _ in 0...numOfQuestions {
            questions.append(Int.random(in: min...max))
        }
        
        userAnswer = 0
        userEntry.removeAll()
        
        gameOn = true
    }
    
    func nextQuestion() {
        if currentQ == numOfQuestions {
            showingEndOfGame = true
        } else {
            currentQ += 1
            userAnswer = 0
            userEntry.removeAll()
        }
    }
    
    func displayQuestion() -> String {

        
        if gameOn {
            return "\(mNumber) x \(questions[currentQ]) = "
        } else {
            return ""
        }
    }
    
    func addNumber(_ num: Int) {
        userAnswer = 0
        userEntry.append(num)
        print(userEntry)
        print("userEntry.count = \(userEntry.count)")
        if userEntry.count == 1 {
            userAnswer = userEntry[0]
        } else {
            for i in 0..<userEntry.count {
                let powOf: Double = pow(10, Double(userEntry.count - i - 1))
                let powOfInt = Int(powOf)
                userAnswer += (userEntry[i] * powOfInt)
            }
        }
    }

    func checkAnswer() {
        let sum = mNumber * questions[currentQ]
        
        if userAnswer == sum {
            resultTitle = "Correct"
            playerScore += 1
        } else {
            resultTitle = "Incorrect"
        }
        
        resultMessage = "\(mNumber) x \(questions[currentQ]) = \(sum)\n\(playerScore) / \(currentQ)"
        
        
        showingMessage = true
        
    }
    
}

struct CalculatorButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 80)
            .background(.gray)
            .clipShape(.rect(cornerRadius: 20))
            //.contentShape(Rectangle())
            .font(.title)
            .foregroundStyle(.white)
            .shadow(color: .black, radius: 1)
    }
}

extension View {
    func calculatorButtonStyle() -> some View {
        modifier(CalculatorButton())
    }
}


#Preview {
    ContentView()
}
