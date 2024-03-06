//
//  ContentView.swift
//  Habit-Tracking_1
//
//  Created by David Stanton on 3/4/24.
//
// Habit-Tracking
// List of all activities, Title and Description
// Form for adding new activities
// Detail Screen
// Button to increment times completed and how times
import SwiftUI

struct ContentView: View {
    @State private var pathStore = PathStore()
    @State private var data = Activities()
    @State private var showingAddActivity = false
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            List(data.activities) { activity in
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    HStack {
                        Text(activity.title + ":")
                        Text(String(activity.timesCompleted))
                            .foregroundStyle(changeColor(for: activity))
                        Text("times")
                    }
                }
            }
            .navigationTitle("Habit-Tracker")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showingAddActivity = true
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(data: data)
            }
        }
    }
    
    func changeColor(for activity: Activity) -> Color {
        if activity.timesCompleted > 20 {
            return .red
        } else if activity.timesCompleted > 10 {
            return .orange
        } else {
            return .black
        }
    }
}

#Preview {
    ContentView()
}
