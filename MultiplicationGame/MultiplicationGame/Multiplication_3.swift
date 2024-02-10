//
//  Multiplication_3.swift
//  MultiplicationGame
//
//  Created by David Stanton on 2/10/24.
//

import SwiftUI

struct Multiplication_3: View {
    @State private var round = Round(mNumber: 1, userMin: 1, userMax: 1, numberOfQuestions: 1)
    @State private var currentQ = 0
    @State private var table = [0]
    @State private var gameOn = false
    @State private var userScore = 0
    @State private var userAnswer = 0
    @State private var answerArray = [Int]()
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    @State private var showingResult = false
    @State private var showingEnd = false
    @State private var showingInput = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.brown, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Multiplication Practice")
                    .font(.title)
                HStack {
                    Button {
                        randomize()
                    } label: {
                        Text("Randomize")
                            .frame(width: 100, height: 50)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    Button {
                        begin()
                    } label: {
                        Text("Begin")
                            .frame(width: 160, height: 50)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                }
                List{
                    Picker("Number to multiply", selection: $round.mNumber) {
                        ForEach(1..<13, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    HStack {
                        Picker("From", selection: $round.userMin) {
                            ForEach(1..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("To", selection: $round.userMax) {
                            ForEach(1..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }

                    }
                    Picker("Number of Questions", selection: $round.numberOfQuestions) {
                        ForEach(round.questionArray, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                
                
                ZStack {
                    Color(.gray)
                        .frame(width: 370, height: .infinity)
                        .clipShape(.rect(cornerRadius: 10))
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        VStack {
                            HStack {
                                if gameOn {
                                    Text("Question #\(currentQ + 1)                     ")
                                    Text("")
                                }
                            }
                            HStack {
                                if gameOn {
                                    Text("\(round.mNumber) x \(table[currentQ]) =                            ")
                                        .font(.headline)
                                    Text("\(userAnswer)")
                                        .font(.headline)
                                        .foregroundStyle(showingInput ? .black : .white)
                                }
                            }
                        }
                        .frame(width: 250, height: 60)
                        .background(gameOn ? .white : .gray)
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(color: .white, radius: 2)
                        
                        Spacer()
                        
                        HStack {
                            ForEach(1..<4, id: \.self) { num in
                                Button {
                                    addNum(num)
                                } label: {
                                    Text("\(num)")
                                        .buttonViewStyle()
                                }
                               
                            }
                        }
                        HStack {
                            ForEach(4..<7, id: \.self) { num in
                                Button {
                                    addNum(num)
                                } label: {
                                    Text("\(num)")
                                        .buttonViewStyle()
                                }
                                
                            }
                        }
                        HStack {
                            ForEach(7..<10, id: \.self) { num in
                                Button {
                                    addNum(num)
                                } label: {
                                    Text("\(num)")
                                        .buttonViewStyle()
                                }
                            }
                        }
                        HStack {
                            Button {
                                if gameOn { clear() }
                            } label: {
                                Text("Clear")
                                    .buttonViewStyle()
                            }
                            Button {
                                addNum(0)
                            } label: {
                                Text("0")
                                    .buttonViewStyle()
                            }
                            Button {
                                if gameOn { enter() }
                            } label: {
                                Text("Enter")
                                    .buttonViewStyle()
                            }
                        }
                    }
                    
                    Spacer()
                    
                    
                }
            }
            Spacer()
        }
        .alert(resultTitle, isPresented: $showingResult) {
            Button("Next") { nextQuestion() }
        } message: {
            Text(resultMessage)
        }
        .alert(resultTitle, isPresented: $showingEnd) {
            Button("Restart") { restart() }
        } message: {
            Text(resultMessage)
        }
    }
    
    func begin() {
        clearAll()
        
        if round.userMin > round.userMax {
            let tempMin = round.userMin
            round.userMin = round.userMax
            round.userMax = tempMin
        }
        
        for _ in 0..<round.numberOfQuestions {
            table.append(Int.random(in: round.userMin...round.userMax))
        }
        print("mNumber, userMin, userMax", round.mNumber, round.userMin, round.userMax)
        print(round.numberOfQuestions)
        print(table)
        
        gameOn = true
    }
    
    func clearAll() {
        table.removeAll()
        userAnswer = 0
        answerArray.removeAll()
    }
    
    func restart() {
        gameOn = false
        clearAll()
    }
    
    func randomize() {
        round.mNumber = Int.random(in: 1...12)
        round.userMin = Int.random(in: 1...12)
        round.userMax = Int.random(in: round.userMin...12)
        //print(round.mNumber, round.userMin, round.userMax)
    }
    
    func addNum(_ num: Int) {
        if gameOn {
            showingInput = true
            answerArray.append(num)
            
            if answerArray.count == 1 {
                userAnswer = num
                print(userAnswer)
            } else {
                userAnswer = 0
                
                for i in 0..<answerArray.count {
                    let place = pow(10, Double(answerArray.count - i - 1))
                    userAnswer += answerArray[i] * Int(place)
                }
            }
            print(answerArray.count)
            print(answerArray)
        }
    }
    
    func clear() {
        userAnswer = 0
        answerArray.removeAll()
        showingInput = false
    }
    
    func enter() {
        let ans = round.mNumber * table[currentQ]
        if userAnswer == ans {
            resultTitle = "Correct"
            resultMessage = "\(round.mNumber) x \(table[currentQ]) = \(ans)"
            userScore += 1
        } else {
            resultTitle = "Incorrect"
            resultMessage = "\(round.mNumber) x \(table[currentQ]) = \(ans)"
        }
        showingResult = true
        showingInput = false
    }
    
    func nextQuestion() {
        
        if currentQ == round.numberOfQuestions - 1 {
            let grade: Double = Double(userScore) / Double(round.numberOfQuestions)
            print(grade)
            resultTitle = "Game Over"
            resultMessage = "Grade: \(grade.formatted(.percent))\n\(userScore) / \(round.numberOfQuestions)"
            showingEnd = true
        } else {
            print("currentQ: ", currentQ)
            print("round.numberOfQuestions: ", round.numberOfQuestions)
            currentQ += 1
        }
        
        userAnswer = 0
        answerArray.removeAll()
        showingInput = false
    }
}

struct Round {
    var mNumber = Int()
    var userMin = Int()
    var userMax = Int()
    var numberOfQuestions = Int()
    
    let questionArray = [1, 7, 12]
    
    init(mNumber: Int = Int(), userMin: Int = Int(), userMax: Int = Int(), numberOfQuestions: Int = Int()) {
        self.mNumber = mNumber
        self.userMin = userMin
        self.userMax = userMax
        self.numberOfQuestions = numberOfQuestions
     
    }
}

#Preview {
    Multiplication_3()
}
