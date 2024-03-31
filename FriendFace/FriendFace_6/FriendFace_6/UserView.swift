//
//  UserView.swift
//  FriendFace_6
//
//  Created by David Stanton on 3/30/24.
//
// ==== UserView ====
// pass in user to work with
// Section for about, contact details, friends
// listStyle is grouped
import SwiftUI

struct UserView: View {
    var user: User
    var body: some View {
        List {
            Section("About") {
                Text(user.about)
            }
            
            Section("Contact Details") {
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(user.name)
        .listStyle(.grouped)
    }
}

#Preview {
    UserView(user: User.exampleUser)
}
