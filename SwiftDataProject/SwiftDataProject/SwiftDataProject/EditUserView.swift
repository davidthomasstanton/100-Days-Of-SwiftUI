//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by David Stanton on 3/21/24.
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
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let exampleUser = User(name: "Paul Hudson", city: "Brighton", joinDate: .now)
        return EditUserView(user: exampleUser)
    } catch {
        return Text("Failed to create container \(error.localizedDescription)")
    }
   
}
