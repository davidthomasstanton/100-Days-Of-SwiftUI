//
//  GuessTheFlag_Practice.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/25/24.
//

import SwiftUI

struct GuessTheFlag_Practice: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    @State private var showingScore: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .bottom, startRadius: 200, endRadius: 1700)
            .ignoresSafeArea()
            
            VStack {
                VStack {
                    Spacer()
                    
                    Text("Guess the flag")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    
                    Spacer()
                    Spacer()
                    
                    VStack (spacing: 15) {
                        Text("Tape the flag of")
                            .font(.subheadline.weight(.semibold))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.bold())
                        
                        VStack (spacing: 15) {
                            ForEach(0..<3) { number in
                                Button {
                                    flagTapped(number)
                                } label: {
                                    Image(countries[number])
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(radius: 05)
                                }
                            }
                        }
                        //Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.thinMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    
                    Spacer()
                    
                }
                .padding(20)
                
                Text("Your score: ???")
                    .font(.title.weight(.semibold))
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score = ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    GuessTheFlag_Practice()
}
