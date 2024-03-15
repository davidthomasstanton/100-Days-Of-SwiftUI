//
//  Lesson-TextEditor.swift
//  Bookworm
//
//  Created by David Stanton on 3/14/24.
//

import SwiftUI

struct Lesson_TextEditor: View {
    @AppStorage("notes_1") private var notes = ""
    var body: some View {
        NavigationStack {
            Form {
                TextEditor(text: $notes)
                    .padding()
                    .textEditorStyle(.plain)
            }
            .navigationTitle("Notes")
        }
    }
}

#Preview {
    Lesson_TextEditor()
}
