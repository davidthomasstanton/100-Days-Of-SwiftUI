//
//  WordScramble_Practice3.swift
//  WordScramble
//
//  Created by David Stanton on 2/5/24.
//

import SwiftUI

struct WordScramble_Practice3: View {
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var usedWords = [String]()
    @State private var playerScore = 0
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section("Score: \(playerScore)") {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .onSubmit(addNewWord)
            .toolbar {
                Button("new word", action: startGame)
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
            
            
        }

    }
    
    func startGame() {
        playerScore = 0
        rootWord = ""
        
        withAnimation {
            usedWords.removeAll()
        }
        if let wordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let wordsString = try? String(contentsOf: wordsURL) {
                let words = wordsString.components(separatedBy: "\n")
                rootWord = words.randomElement() ?? "silkworm"
                return
            }
        }
        
        fatalError("We're going down, Captain.")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        guard isReal(word: answer) else {
            wordError(title: "Not a word", message: "You can't just make it up, ya, know?")
            return
        }
        guard tooShort(word: answer) else {
            wordError(title: "Too Short", message: "Word must be 3 characters long")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Not possible", message: "You cannot make \(answer) from \(rootWord)")
            return
        }
        guard isUsed(word: answer) else {
            wordError(title: "Already used", message: "\(answer) has been used already")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        playerScore += answer.count
        newWord = ""
        
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func tooShort(word: String) -> Bool {
        return !(word.count < 3)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isUsed(word: String) -> Bool {
        return !usedWords.contains(word)
    }
}

#Preview {
    WordScramble_Practice3()
}
