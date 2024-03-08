//
//  ContentView.swift
//  Habit-Tracking_3
//
//  Created by David Stanton on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var showingAddActivity = false
    var body: some View {
        NavigationStack {
            List(data.activities) { activity in
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    VStack(alignment: .leading) {
                        Text(activity.name)
                            .font(.title)
                        HStack {
                            Text("Completion Count:")
                            Text(String(activity.completionCount))
                                .padding(.horizontal)
                                .background(.red)
                                .clipShape(.capsule)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button {
                    showingAddActivity.toggle()
                } label: {
                    Label("Add Activity", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(data: data)
            }
        }
    }
}

#Preview {
    ContentView()
}
