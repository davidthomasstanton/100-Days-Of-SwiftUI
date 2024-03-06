//
//  ActivityView.swift
//  Habit-Tracking_1
//
//  Created by David Stanton on 3/5/24.
//

import SwiftUI

struct ActivityView: View {
    var data: Activities
    var activity: Activity
    var body: some View {
        NavigationStack {
            List {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
                Text("Times Completed: \(activity.timesCompleted)")
            }
            .navigationTitle(activity.title)
            
            Button("Mark Completed") {
                var adjustedActivity = activity
                adjustedActivity.timesCompleted += 1
                if let index = data.activities.firstIndex(of: activity) {
                    data.activities[index] = adjustedActivity
                }
            }
        }
    }
}

#Preview {
    ActivityView(data: Activities(), activity: Activity.example)
}
