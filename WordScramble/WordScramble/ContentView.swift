//
//  ContentView.swift
//  WordScramble
//
//  Created by David Stanton on 2/2/24.
//

import SwiftUI

struct ContentView: View {
    // variables for usedWords, rootWord, newWord
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    // variables for errors
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var playerScore = 0
    
    var body: some View {
        // NavigationStack with Sections to Enter your word
        
        NavigationStack {
            List {
                // Section to enter newWord
                Section {
                    TextField("Enter your word", text: $newWord)
                        // set auto capitalization to never
                        .textInputAutocapitalization(.never)
                }
                
                // Section to display usedWords
                Section("Player Score: \(playerScore)") {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            // Add an SFSymbol to display the character count of word
                            
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("\(word)")
                        .accessibilityHint("\(word.count) letters")
                    }
                }
            }
            .listStyle(.sidebar)
            .toolbar {
                Button("new word", action: startGame)
            }

            .navigationTitle(rootWord)
                        
            // onSubmit, add new word
            .onSubmit(addNewWord)
            
            // load start and pick a random word
            .onAppear(perform: startGame)
            
            // alert for errors
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    // function to addNewWord
    func addNewWord() {
        // constant that stores the word in lowercased and trimmed
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else { return }
        
        // throw errors ifOriginal, isPossible, isReal and return
        guard isOriginal(word: answer) else {
            wordError(title: "Word used alread", message: "Try again!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell '\(answer)' from '\(rootWord)'")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isShort(word: answer) else {
            wordError(title: "Too Short", message: "Word must be at least 3 characters long.")
            return
        }
        
        guard isRootWord(word: answer) else {
            wordError(title: "Cannot be prompt", message: "\(answer) is the root word")
            return
        }
        
        // insert newWord into usedWords at index 0
        // add an animation to slide words in
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        // increase score
        playerScore += newWord.count
        
        // reset newWord
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
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                
                // reset score
                playerScore = 0
                
                // reset usedWords
                withAnimation {
                    usedWords.removeAll()
                }
                // If we're here everything has worked, so we can exit
                return
            }
        }
        
        // If we're *here* then there was a problem -- trigger a crash and report the error
        fatalError("Could not load start.txt from bundle")
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
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    // func isReal to check if word is real
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    // func isShort to check for words
    func isShort(word: String) -> Bool {
        return !(word.count < 3)
    }
    
    // func isRootWord
    func isRootWord(word: String) -> Bool {
        return !(word == rootWord)
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
