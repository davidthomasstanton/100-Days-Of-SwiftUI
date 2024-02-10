//
//  Multiplication_2.swift
//  MultiplicationGame
//
//  Created by David Stanton on 2/9/24.
//

import SwiftUI

struct Multiplication_2: View {
    let questionArray = [1, 3, 5]
    
    @State private var mNum = 0
    @State private var min = 0
    @State private var max = 0
    @State private var numOfQuestions = 1
    @State private var gameOn = false
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    @State private var showingResult = false
    @State private var showingEnd = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray, .black], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Multiplication Practice")
                    .font(.title)
                    .foregroundStyle(.white)
                Button {
                    //
                    // startGame()
                } label: {
                    Text("Begin")
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 20))
                }
                
                Form {
                    Picker("Number to multiply", selection: $mNum) {
                        ForEach(1..<13, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    HStack {
                        Picker("From", selection: $min) {
                            ForEach(1..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("To", selection: $max) {
                            ForEach(1..<13, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    Picker("Number of Questions", selection: $numOfQuestions) {
                        ForEach(questionArray, id: \.self) {
                            Text("\($0)")
                        }
                        .pickerStyle(.segmented)
                    }
                }
                
                VStack {
                    HStack {
                        ForEach(1..<4) { num in
                            Button {
                                // addNum
                            } label: {
                                Text("\(num)")
                            }
                        }
                    }
                }
                
            }
            .padding(20)
        }
    }
}

struct Questions {
    var mNumber = Int()
    var userMin = Int()
    var userMax = Int()
    var numOfQuestions = Int()
    var table = [Int]()
    
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
}

#Preview {
    Multiplication_2()
}
