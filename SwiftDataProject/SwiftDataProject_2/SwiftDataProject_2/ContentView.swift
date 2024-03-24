//
//  ContentView.swift
//  SwiftDataProject_2
//
//  Created by David Stanton on 3/22/24.
//
// ==== UsersView ====
// query users
// List users by name, display the number of jobs each has
// create a dynamic initializer that filters users is they joined after the minimumJoinDate
// include a sortOrder that is passed in
// function addSample() to add a user with new jobs
// #Preview, pass in min join date of .now and a sortOrder of User.name
// create a modelContainer for the data class
// ==== EditUserView ====
// var: bindable user
// form that lets you adjust name, city, joinDate
// preview to handle bindable user
// ==== User ====
// var: name, city, joinDate
// assign a jobs variable with a relationship delete rule of cascade
// ==== Job ====
// var: name, priority, owner is an optional User
// ==== ContentView ====
// var: modelContext, showingUpcomingOnly, sortOrder [by name, by join date]
// nav stack that shows UsersView, do a check for showingUpcomingOnly and pass in .now or .distantPass, and sortOrder
// toolbar with a button to Add dummy samples and a Button to toggle showingUpcomingOnly or everyone
// Menu with a picker inside sorting between the [name, joinDate] or the [joinDate, name]

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
                .toolbar {
                    Button("Add Samples", systemImage: "plus") {
                        try? modelContext.delete(model: User.self)
                        
                        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                        let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                        
                        modelContext.insert(first)
                        modelContext.insert(second)
                        modelContext.insert(third)
                        modelContext.insert(fourth)
                    }
                    
                    Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                    
                    Menu("Sort Order", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name")
                                .tag([SortDescriptor(\User.name),
                                      SortDescriptor(\User.joinDate)])
                            Text("Srot by join date")
                                .tag([SortDescriptor(\User.joinDate),
                                      SortDescriptor(\User.name)])
                        }
                    }
                }
            }
            .navigationTitle("Users")
            
        }
    
}

#Preview {
    ContentView()
}
