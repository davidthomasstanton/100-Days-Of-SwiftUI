//
//  UserView.swift
//  FriendFace
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
                    .padding(.vertical)
                
            }
            Section("Contact Details") {
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserView(user: .exampleUser)
}
