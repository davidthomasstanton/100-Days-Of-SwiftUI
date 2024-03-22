//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by David Stanton on 3/20/24.
//
// ==== ContentView ====
// var: modelContext, users, path
// NavStack bound to the path with a list of user NavigationLinks
// navDestination is the EditUserView
// toolbar to add a user that creates a blank user and moves to the EditUserView
// ==== EditUserView ====
// var: bindable user
// form that lets you adjust name, city, joinDate
// preview to handle bindable user
// ==== User ====
// var: name, city, joinDate
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
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
