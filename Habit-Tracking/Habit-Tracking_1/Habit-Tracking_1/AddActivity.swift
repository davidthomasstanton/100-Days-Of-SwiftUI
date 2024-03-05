//
//  AddActivity.swift
//  Habit-Tracking_1
//
//  Created by David Stanton on 3/4/24.
//

import SwiftUI

struct AddActivity: View {
    var data: Activities
    @State private var title = ""
    @State private var description = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title" , text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle(title.isEmpty ? "Activity..." : title)
            .toolbar {
                Button("Save Activity") {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard trimmedTitle.isEmpty == false else { return }
                    data.addActivity(title: title, description: description)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddActivity(data: Activities())
}
