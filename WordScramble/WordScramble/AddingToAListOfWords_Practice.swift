//
//  AddingToAListOfWords_Practice.swift
//  WordScramble
//
//  Created by David Stanton on 2/2/24.
//

import SwiftUI

struct AddingToAListOfWords_Practice: View {
    // variables for usedWords, rootWord, newWord
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        // NavigationStack with Sections to Enter your word
        
        NavigationStack {
            List {
                // Section to enter newWord in lowercase
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                // Section to display usedWords
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            
            // onSubmit, add new word
            .onSubmit(addNewWord)
        }
    }
    
    // function to addNewWord
    func addNewWord() {
        // constant "answer" that stores the word in lowercased and trimmed
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else { return }
        
        // extra validation to come
        
        // insert newWord into usedWords at index 0
        // add an animation to slide words in
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        // reset newWord
        newWord = ""
    }
    

}

#Preview {
    AddingToAListOfWords_Practice()
}
