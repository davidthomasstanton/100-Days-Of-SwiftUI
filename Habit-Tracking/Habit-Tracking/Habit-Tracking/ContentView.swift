//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by David Stanton on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationStack {
            List(data.activities) { activity in
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    HStack {
                        Text(activity.title)
                        
                        Spacer()
                        
                        Text(String(activity.timesCompleted))
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(color(for: activity))
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
            }
            .navigationTitle("Habit-Tracking")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    addingNewActivity.toggle()
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
    
    func color(for activity: Activity) -> Color {
        if activity.timesCompleted < 3 {
            .red
        } else if activity.timesCompleted < 10 {
            .orange
        } else if activity.timesCompleted < 20 {
            .green
        } else {
            .indigo
        }
    }
}

#Preview {
    ContentView()
}
