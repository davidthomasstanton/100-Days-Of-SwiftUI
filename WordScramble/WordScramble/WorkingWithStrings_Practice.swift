//
//  WorkingWithStrings_Practice.swift
//  WordScramble
//
//  Created by David Stanton on 2/2/24.
//

import SwiftUI

struct WorkingWithStrings_Practice: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        var text = checkString()
        ForEach(text, id: \.self) { word in
            Text(word.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }
    func checkString() -> [String] {
        // separate String by whitespace
        var input = "Hello, World!"
        var words = input.components(separatedBy: " ")
        
        
        // separate a string by new lines
        //words = input.components(separatedBy: "\n")
        
        // trim a string by whitespace and new lines
        
        return words

    }
}

#Preview {
    WorkingWithStrings_Practice()
}
