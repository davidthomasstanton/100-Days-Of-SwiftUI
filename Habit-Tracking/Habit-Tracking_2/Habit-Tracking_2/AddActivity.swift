//
//  AddActivity.swift
//  Habit-Tracking_2
//
//  Created by David Stanton on 3/6/24.
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
                Button {
                    let activity = Activity(name: name, description: description, timesCompleted: 0)
                    data.activities.append(activity)
                    dismiss()
                } label: {
                    Text("Save Activity")
                }
            }
        }
    }
}

#Preview {
    AddActivity(data: Activities())
}
