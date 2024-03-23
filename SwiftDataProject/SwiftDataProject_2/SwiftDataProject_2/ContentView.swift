//
//  ContentView.swift
//  SwiftDataProject_2
//
//  Created by David Stanton on 3/22/24.
//
// ==== ContentView ====
// var: modelContext, users, path
// NavStack bound to the path with a list of user NavigationLinks
// navDestination is the EditUserView
// toolbar to add a user that creates a blank user and moves to the EditUserView
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    VStack {
                        Text(user.name)
                        Text(user.city)
                    }
                }
                .navigationDestination(for: User.self) { user in
                    EditUserView(user: user)
                }
                .toolbar {
                    Button("Add User", systemImage: "plus") {
                        let newUser = User(name: "", city: "", joinDate: .now)
                        modelContext.insert(newUser)
                        path = [user]
                    }
                }
            }
            .navigationTitle("Users")
            
        }
    }
}

#Preview {
    ContentView()
}
