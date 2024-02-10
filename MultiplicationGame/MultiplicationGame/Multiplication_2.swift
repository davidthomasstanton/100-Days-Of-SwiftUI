//
//  Multiplication_2.swift
//  MultiplicationGame
//
//  Created by David Stanton on 2/9/24.
//

import SwiftUI

struct Multiplication_2: View {
    
    
    @State private var userAnswer = 0
    @State private var userAnswerArray = [0]
    @State private var playerScore = 0
    //@State private var qNum = 1
    @State private var showInput = false
    @State private var gameOn = false
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    @State private var showingResult = false
    @State private var showingEnd = false
    @State private var round = Questions(mNumber: 1, userMin: 1, userMax: 12, numOfQuestions: 1)

    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Multiplication Practice")
                    .font(.title)
                    .foregroundStyle(.white)
                HStack {
                    Button {
                        randomizeSettings()
                    } label: {
                        Text("Randomize")
                            .frame(width: 140, height: 50)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                    
                    Button {
                        begin()
                    } label: {
                        Text("Begin")
                            .frame(width: 205, height: 50)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                }
                
                Form {
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
                    Picker("Number of Questions", selection: $round.numOfQuestions) {
                        ForEach(round.questionArray, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                    VStack {
                        
                        HStack {
                            Text("Question # \(round.currentQ)  ")
                            Text(gameOn ? round.displayQuestion() : "X x Y = ")
                            Text("\(userAnswer)")
                                .font(.headline)
                                .foregroundStyle(showInput ? .black : .gray)
                        }
                        .frame(width: 250, height: 50)
                        .background(.gray)
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(color:.white, radius: 2)
                        
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
                                clear()
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
                                enter()
                            } label: {
                                Text("Enter")
                                    .buttonViewStyle()
                            }
                        }
                    }
                    .padding()
                }
                
            }
            .onAppear(perform: setup)
            .padding(20)
            
        }
        .alert(resultTitle, isPresented: $showingResult) {
            Button("Next") {
                nextQuestion()
            }
        } message: {
            Text(resultMessage)
        }
        .alert(resultTitle, isPresented: $showingEnd) {
            Button("New Game") {
                setup()
            }
        } message: {
            Text(resultMessage)
        }
    }
    
    func setup() {
        round.mNumber = 1
        round.userMin = 1
        round.userMax = 12
        round.numOfQuestions = round.questionArray[0]
        round.generateTable()
        
    }
    
    func randomizeSettings() {
        round.mNumber = Int.random(in: 1...12)
        round.userMin = Int.random(in: 1...12)
        round.userMax = Int.random(in: round.userMin...12)
        round.numOfQuestions = round.questionArray[Int.random(in: 0...2)]
        round.generateTable()
    }
    
    func begin() {
        playerScore = 0
        gameOn = true
        nextQuestion()
        //print("userMin", round.userMin, "userMax", round.userMax)
    }
    
    func addNum(_ num: Int) {
        var tempA = 0
        userAnswerArray.append(num)
        
        if userAnswerArray.count == 1 {
            tempA = num
        } else {
            for i in 0..<userAnswerArray.count {
                let place = pow(10, Double(userAnswerArray.count - i - 1))
                tempA += userAnswerArray[i] * Int(place)
            }
        }
        showInput = true
        userAnswer = tempA
    }
    
    func nextQuestion() {
        clear()
        if round.currentQ == round.numOfQuestions {
            resultTitle = "Game Over"
            resultMessage = "You got \(playerScore) / \(round.numOfQuestions)"
            showingEnd = true
        } else {
            round.nextQ()
        }
    }
    
    func clear() {
        userAnswer = 0
        userAnswerArray.removeAll()
        showInput = false
    }
    
    func enter() {
        let correctQ = round.table[round.currentQ] * round.mNumber
        if userAnswer == correctQ {
            playerScore += 1
            resultTitle = "Correct"
            resultMessage = "\(round.mNumber) * \(round.table[round.currentQ]) = \(userAnswer)\n\(playerScore) / \(round.currentQ)"
        } else {
            resultTitle = "Incorrect"
            resultMessage = "\(round.mNumber) * \(round.table[round.currentQ]) = \(correctQ)"
        }
        showingResult = true
    }
    
    
}

struct Questions {
    var mNumber = Int()
    var userMin = Int()
    var userMax = Int()
    var numOfQuestions = Int()
    var table = [Int]()
    var currentQ = 0
    
    let questionArray = [1, 3, 5]
    
    init(mNumber: Int = Int(), userMin: Int = Int(), userMax: Int = Int(), numOfQuestions: Int = Int()) {
        self.mNumber = mNumber
        self.userMin = userMin
        self.userMax = userMax
        self.numOfQuestions = numOfQuestions
    }
    
    mutating func generateTable() {
        
        for _ in 0..<numOfQuestions {
            let ranInRange = Int.random(in: userMin...userMax)
            table.append(ranInRange)
        }
    }
    
    func displayQuestion() -> String {
        print(table, currentQ, numOfQuestions)
        return "\(mNumber) x \(table[currentQ - 1]) ="
    }
    
    mutating func nextQ() {
        currentQ += 1
    }
}

struct ButtonView: ViewModifier {
    func body(content: Content) -> some View {
        let squareD: CGFloat = 77
        content
            .font(.system(size: 30))
            .frame(width: squareD, height: squareD)
            .background(.gray)
            .foregroundStyle(.indigo)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(color:.white, radius: 2)
    }
}

extension View {
    func buttonViewStyle() -> some View {
        modifier(ButtonView())
    }
}

#Preview {
    Multiplication_2()
}
