//
//  ContentView.swift
//  FriendFace_1
//
//  Created by David Stanton on 3/28/24.
//
// ==== ContentView ====
// assign users, list them in a NavStack with a green circle for active, red for not
// navdestination sends to a UserView
// function to fetchUsers asynchronously
// check if data has alredy been fetched
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
                        .foregroundStyle(user.isActive ? .green : .red)
                        .frame(width: 30)
                    Text(user.name)
                }
            }
            .navigationTitle("FriendFace")
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
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
            print("Error loading json \(error.localizedDescription)")
        }
        
    }
}

#Preview {
    ContentView()
}
