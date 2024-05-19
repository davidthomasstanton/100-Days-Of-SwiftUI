//
//  ContentView.swift
//  Day_100-Final_Exam
//
//  Created by David Stanton on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: Day_100_Final_ExamDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(Day_100_Final_ExamDocument()))
}
