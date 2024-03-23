//
//  EditUserView.swift
//  SwiftDataProject_2
//
//  Created by David Stanton on 3/22/24.
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
        let exampleUser = User(name: "Dude, McMann", city: "Rock-n-Roll Vegas", joinDate: .now)
        return EditUserView(user: exampleUser)

    } catch {
        return Text("Could not create preview \(error.localizedDescription)")
    }
}
