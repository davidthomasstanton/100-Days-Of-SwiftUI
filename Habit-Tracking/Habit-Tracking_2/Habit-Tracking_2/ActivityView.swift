//
//  ActivityView.swift
//  Habit-Tracking_2
//
//  Created by David Stanton on 3/6/24.
//

import SwiftUI

struct ActivityView: View {
    var data: Activities
    @State var activity: Activity
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(activity.name)
                    .font(.title)
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
                HStack {
                    Text("Completion Count:")
                    Text(String(activity.timesCompleted))
                }
                Spacer()
            }
            Button {
                var adjustedActivity = activity
                adjustedActivity.timesCompleted += 1
                if let index = data.activities.firstIndex(of: activity) {
                    data.activities[index] = adjustedActivity
                }
            } label: {
                Text("Mark Completed")
                    .font(.title)
            }
            Spacer()
        }
    }
}

#Preview {
    ActivityView(data: Activities(), activity: Activity.example)
}
