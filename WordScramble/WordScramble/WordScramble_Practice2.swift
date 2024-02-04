//
//  WordScramble_Practice2.swift
//  WordScramble
//
//  Created by David Stanton on 2/3/24.
//

import SwiftUI

struct WordScramble_Practice2: View {
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var usedWords = [String]()
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var playerScore = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section{
                    TextField("Enter word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section("Player Score: \(playerScore)") {
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
        usedWords.removeAll()
        newWord = ""
        
        if let wordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let wordString = try? String(contentsOf: wordURL) {
                let words = wordString.components(separatedBy: "\n")
                rootWord = words.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("We're going down captain.")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isTooShort(word: answer) else {
            wordError(title: "Too short", message: "word must be 3 letters long")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Made-up", message: "\(answer) is not in the dictionary")
            return
        }
        guard isUsed(word: answer) else {
            wordError(title: "Duplicate", message: "\(answer) has already been entered")
            return
        }
        guard isNotInRoot(word: answer) else {
            wordError(title: "Not in Prompt", message: "\(answer) is not present in \(rootWord)")
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
    
    func isTooShort(word: String) -> Bool {
        return !(word.count < 3)
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func isUsed(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isNotInRoot(word: String) -> Bool {
        var tempRoot = rootWord
        
        for letter in word {
            if let pos = tempRoot.firstIndex(of: letter) {
                tempRoot.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
}

#Preview {
    WordScramble_Practice2()
}
