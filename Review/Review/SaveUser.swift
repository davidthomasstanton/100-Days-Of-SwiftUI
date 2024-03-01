//
//  SaveUser.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI
struct User: Codable {
    var firstName: String
    var lastName: String
}
struct SaveUser: View {
    @State private var user = User(firstName: "T", lastName: "Swift")
    var body: some View {
        Button("Add User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    SaveUser()
}
