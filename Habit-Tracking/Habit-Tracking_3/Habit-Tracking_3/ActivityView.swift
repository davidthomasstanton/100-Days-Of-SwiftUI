//
//  ActivityView.swift
//  Habit-Tracking_3
//
//  Created by David Stanton on 3/7/24.
//

import SwiftUI

struct ActivityView: View {
    var data: Activities
    var activity: Activity
    
    var body: some View {
        List {
            Section(activity.name) {
                Text(activity.description)
                    .font(.body)
                HStack {
                    Text("Completion Count:")
                    Text(String(activity.completionCount))
                }
                Button("Mark Completed") {
                    var adjustedActivity = activity
                    adjustedActivity.completionCount += 1
                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index] = adjustedActivity
                    }
                }
                
            }
        }
    }
}

#Preview {
    ActivityView(data: Activities(), activity: Activity.example)
}
