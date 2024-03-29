//
//  ContentView.swift
//  FriendFace_5
//
//  Created by David Stanton on 3/28/24.
//
// ==== User ====
// struct that is Codable, Identifiable, Hashable
// variables for each field of the JSON
// create exampleUser
// ==== Friend ====
// struct that creates var for id and name
// ==== UserView ====
// pass in user to work with
// Section for about, contact details, friends
// listStyle is grouped
// ==== ContentView ====
// assign users, list them in a NavStack with a green circle for active, red for not
// navdestination sends to a UserView
// function to fetchUsers asynchronously
// Don't re-fetch data if we already have it
// do block that gets url, creates a session to get data
// decodes the data into users with a decoding strategy of .iso8601 for the date
// https://www.hackingwithswift.com/samples/friendface.json

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    Circle()
                        .frame(width: 30)
                        .foregroundStyle(user.isActive ? .green : .red)
                    Text(user.name)
                }
            }
            .navigationTitle("FriendFace")
            .navigationDestination(for: User.self) { user in
                Text(user.name)
            }
            .task {
                await fetchUsers()
            }
        }
    }
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Could not load JSON \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
