//
//  EditUserView.swift
//  SwiftDataProject_4
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
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let exampleUser = User(name: "Person", city: "Place", joinDate: .now)
        return EditUserView(user: exampleUser)
            .modelContainer(container)
    } catch {
        return Text("Could not generate preview \(error.localizedDescription)")
    }
}
