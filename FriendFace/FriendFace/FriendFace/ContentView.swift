//
//  ContentView.swift
//  FriendFace
//
//  Created by David Stanton on 3/27/24.
//
// https://www.hackingwithswift.com/samples/friendface.json

import SwiftUI

struct ContentView: View {
    var users = [User]()
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    
                } label: {
                    VStack {
                        Text(user.name)
                        Text(user.isActive ? "Active" : "Not Active")
                            .foregroundStyle(.white)
                            .padding()
                            .background(user.isActive ? .gray : .green)
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
    }
}

#Preview {
    ContentView()
}
