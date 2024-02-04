//
//  WordScramble_Practice.swift
//  WordScramble
//
//  Created by David Stanton on 2/3/24.
//

import SwiftUI

struct WordScramble_Practice: View {
    // variables for usedWords, rootWord, newWord
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    // variables for errorTitle, errorMessage, showingError
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        // NavigationStack & List with title of rootWord
        // Section to enter newWord
        // Section to display usedWords with SF Symbol
        // when submitted, add the new word
        // on start, start game
        // alert for errors
        
        NavigationStack {
            List {
                Section() {
                    TextField("Enter word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section("Words contained in \(rootWord)") {
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
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }

        }
    }
    
    // function to addNewWord
    // constant "answer" that stores the word in lowercase and trimmed of white space and new lines
    // exit if the string is empty
    // errors for ifOriginal, isPossible, isReal and exit
    // insert newWord into usedWords at index 0 with an animation
    // reset newWord
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        guard isReal(word: answer) else {
            wordError(title: "not real", message: "\(answer) is not a word")
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "not original", message: "You've already used \(answer)")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "not possible", message: "You can't make \(answer) from \(rootWord)")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""   
    }
    
    // function startGame to load start.txt
    // 1. Find the URL for start.txt in our app bundle
    // 2. Load start.txt into a string
    // 3. Split the string up into an array of strings, splitting on line breaks
    // 4. Pick one random word, or use "silkworm" as a sensible default
    // If we're here everything has worked, so we can exit
    // If we're *here* then there was a problem -- trigger a crash and report the error
    func startGame() {
        if let wordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let wordsString = try? String(contentsOf: wordsURL) {
                let wordsArray = wordsString.components(separatedBy: "\n")
                rootWord = wordsArray.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("There has been a fatal error")
    }
    
    // func isReal to check if word is real
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    // function isOriginal to check if we've used the word before
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // function isPossible that checks if the newWord is made of the rootWord
    // 1. make variable tempWord of rootWord
    // 2. loop over each letter of newWord if so, remove from tempWord
    // 3. if we get to the end, return true, else return false
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in newWord {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    // func wordError that sets errorTitle/Message and throws alert
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    WordScramble_Practice()
}
