//
//  AddActivity.swift
//  Habit-Tracking_3
//
//  Created by David Stanton on 3/7/24.
//

import SwiftUI

struct AddActivity: View {
    var data: Activities
    @State private var name = ""
    @State private var description = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save Activity") {
                    let newActivity = Activity(name: name, description: description, completionCount: 0)
                    data.activities.append(newActivity)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddActivity(data: Activities())
}
