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
    
    @State private var userNum = 1
    @State private var userMin = 1
    @State private var userMax = 1
    @FocusState private var userEntering: Bool
    @State private var userQuestionNum = 1
    @State private var gameOn = false
    @State private var userScore = 0
    @State private var showingResult = false
    @State private var question = ""
    @State private var questions = [0]
    @State private var questionCursor = 0
    @State private var userAnswerArray = [Int]()
    @State private var userAnswer = 0
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    
    let numOfQuestions = [3, 5, 10]
    
    var body: some View {
        ZStack {
            VStack {
                Text("Mutliplication Table")
                    .font(.largeTitle)
                Button("Begin", action: startGame)
                VStack {
                    Form {
                        Picker("Number to multiply: ", selection: $userNum) {
                            ForEach(0..<12) {
                                Text("\($0)")
                            }
                        }
                        Picker("From: ", selection: $userMin) {
                            ForEach(0..<12) {
                                Text("\($0)")
                            }
                        }
                        Picker("To: ", selection: $userMax) {
                            ForEach(0..<12) {
                                Text("\($0)")
                            }
                        }
                        Text("Number of Questions: \(userQuestionNum)")
                        Picker("Number of Questions", selection: $userQuestionNum) {
                            ForEach(numOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                }
                
                Text(displayQuestion())
                    .font(.headline)
                    .foregroundStyle(gameOn ? .black : .white)
                    .animation(.easeOut(duration: 0.5), value: gameOn)
                
                ZStack {
                    
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(gameOn ? .white : .gray)
                        .clipShape(.rect(cornerRadius: 20))
                        .animation(.easeOut(duration: 0.5), value: gameOn)
                        
                    VStack {
                        Spacer()
                        Text("User Entry: \(userAnswer)")
                            .font(.headline)
                            .foregroundStyle(gameOn ? .black : .gray)
                            .animation(.easeOut(duration: 0.5), value: gameOn)
                        
                        
                        HStack {
                            ForEach(1..<4) { num in
                                Button("\(num)") {
                                    //
                                    addUserNum(num)
                                }
                                .frame(width: 100, height: 70)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 20))
                            }
                        }
                        
                        HStack {
                            ForEach(4..<7) { num in
                                Button("\(num)") {
                                    addUserNum(num)
                                }
                                .frame(width: 100, height: 70)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 20))
                            }
                        }
                        
                        HStack {
                            ForEach(7..<10) { num in
                                Button("\(num)") {
                                    addUserNum(num)
                                }
                                .frame(width: 100, height: 70)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 20))
                            }
                        }
                        
                        HStack {
                            Button("Clear") {
                                userAnswer = 0
                                userAnswerArray.removeAll()
                            }
                            .frame(width: 100, height: 70)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 20))
                                
                            Button("0") {
                                addUserNum(0)
                            }
                            .frame(width: 100, height: 70)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 20))
                            
                            Button("Enter") {
                                checkAnswer()
                            }
                            .frame(width: 100, height: 70)
                            .background(.indigo)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 20))
                            
                        }
                        Spacer()
                        Spacer()
                    }
                }
            }
            .padding()
            
            
        }
        .onAppear(perform: setup)
        .alert(resultTitle, isPresented: $showingResult) {
            Button("Next") { }
        } message: {
            Text(resultMessage)
        }
        
    }
    
    func startGame() {
        questions.removeAll()
        questions.append(0)
        //userQuestionNum = numOfQuestions[Int.random(in: 0...2)]
        gameOn = true
        var min = (userMin <= userMax) ? userMin : userMax
        var max = (userMin <= userMax) ? userMax : userMin
        print("User num = \(userNum)")
        print(userQuestionNum)
        for _ in 0..<userQuestionNum {
            questions.append(Int.random(in: min...max))
        }
        
        print(questions)
        questionCursor += 1
        
        userAnswer = 0
        userAnswerArray.removeAll()
        
    }
    func setup() {
        questions.removeAll()
        questions.append(0)
        userMin = Int.random(in: 1...12)
        userMax = Int.random(in: userMin...12)
        userNum = Int.random(in: 1...12)
        userQuestionNum = numOfQuestions[Int.random(in: 0...2)]
    }
    
    func addUserNum(_ num: Int) {
        userAnswer = 0
        userAnswerArray.append(num)
        print("User Answer Array.count = \(userAnswerArray.count)")
        
        for i in 0..<userAnswerArray.count {
            if userAnswerArray.count == 1 {
                userAnswer = userAnswerArray[0]
                print(userAnswer)
            } else {
                let multPow: Double = pow(10, Double(userAnswerArray.count - i - 1))
                userAnswer += (userAnswerArray[i] * Int(multPow))

                print(userAnswerArray)
                print(userAnswer)
            }
        }
    }
    
    func displayQuestion() -> String {
        questionCursor += 1
        return "\(userNum) x \(questions[questionCursor]) ="
    }
    
    func checkAnswer() {
        let tempAns = userNum * questions[questionCursor]
        print(tempAns)
        if tempAns == userAnswer {
            resultTitle = "Correct"
            resultMessage = "\(userNum) x \(questions[questionCursor]) = \(tempAns)"
        } else {
            resultTitle = "\(questions[questionCursor]) is incorrect"
            resultMessage = "\(userNum) x \(questions[questionCursor]) = \(tempAns)"
        }
        showingResult = true
        userAnswer = 0
        userAnswerArray.removeAll()
    }

}

#Preview {
    ContentView()
}
