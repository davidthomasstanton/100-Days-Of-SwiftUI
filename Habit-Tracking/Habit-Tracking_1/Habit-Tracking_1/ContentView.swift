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
    @State private var showingSheet = false
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            List(data.activities) { activity in
                NavigationLink {
                    AddActivity(data: data)
                } label: {
                    HStack {
                        Text(activity.title)
                        Text(String(activity.timesCompleted))
                    }
                }
            }
            .navigationTitle("Habit-Tracker")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showingSheet = true
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddActivity(data: data)
            }
        }
    }
}

#Preview {
    ContentView()
}
