//
//  UserView.swift
//  FriendFace_2
//
//  Created by David Stanton on 3/28/24.
//
// ==== UserView ====
// pass in user to work with
// Section for about, contact details, friends
// listStyle is grouped

import SwiftUI

struct UserView: View {
    let user: User
    var body: some View {
        List {
            Section("About") {
                Text(user.about)
            }
            
            Section("Contact Details") {
                Text(user.email)
                Text(user.address)
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
    }
}

#Preview {
    UserView(user: User.exampleUser)
}
