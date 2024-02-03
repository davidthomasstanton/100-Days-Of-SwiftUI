//
//  WorkingWithStrings.swift
//  WordScramble
//
//  Created by David Stanton on 2/2/24.
//

import SwiftUI

struct WorkingWithStrings: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

    func testStrings() {
        let input = "a b c"
        
        // separate String by whitespace
        let letters = input.components(separatedBy: " ")
        
        let input2 = """
        a
        b
        c
        """
        
        // separate a string by new lines
        let letters2 = input2.components(separatedBy: "\n")
        let letter = letters2.randomElement()
        
        // trim a string by whitespace and new lines
        var trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
    }
    
    // function to check spelling
    func checkSpelling() {
        
        // 1. create a words to check and an instance of UITextChecker
        let word = "swift"
        let checker = UITextChecker()
        
        // 2. tell the checker how much of our string we want to check
        let range = NSRange(location: 0, length: word.utf16.count)
        
        // 3. ask text checker to report where it found any misspellings, passing in the range to check
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        // 4. check spelling result to see if there was a mistake
        var allGood = misspelledRange.location == NSNotFound
        
    }
}

#Preview {
    WorkingWithStrings()
}
