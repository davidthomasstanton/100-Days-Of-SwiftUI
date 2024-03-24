//
//  EditUserView.swift
//  SwiftDataProject_5
//
//  Created by David Stanton on 3/23/24.
//
// ==== EditUserView ====
// var: bindable user
// form that lets you adjust name, city, joinDate
// preview to handle bindable user
import SwiftData
import SwiftUI

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $user.name)
                TextField("City", text: $user.city)
                DatePicker("Date Joined", selection: $user.joinDate)
            }
            .navigationTitle("Edit User")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let exampleUser = User(name: "Dude McMann", city: "Hometowm", joinDate: .now)
        return EditUserView(user: exampleUser)
            .modelContainer(container)
    } catch {
        return Text("Could not create preview \(error.localizedDescription)")
    }
}
