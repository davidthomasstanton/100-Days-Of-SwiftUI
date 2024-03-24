//
//  UsersView.swift
//  SwiftDataProject_2
//
//  Created by David Stanton on 3/23/24.
//
// ==== UsersView ====
// query users
// List users by name, display the number of jobs each has
// create a dynamic initializer that filters users is they joined after the minimumJoinDate
// include a sortOrder that is passed in
// function addSample() to add a user with new jobs
// #Preview, pass in min join date of .now and a sortOrder of User.name
// create a modelContainer for the data class
import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text(String(user.unwrappedJobs.count))
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: addSample)
    }
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user1 = User(name: "Kip", city: "Los Angeles", joinDate: .now)
        let job1 = Job(name: "Lick Bath", priority: 1)
        let job2 = Job(name: "Hunt mice", priority: 1000)
        modelContext.insert(user1)
        user1.jobs?.append(job1)
        user1.jobs?.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
