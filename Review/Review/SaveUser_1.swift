//
//  SaveUser_1.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI
struct User_1: Codable {
    let firstName: String
    let lastName: String
}
struct SaveUser_1: View {
    @State private var newUser_1 = User_1(firstName: "D", lastName: "Stan")
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(newUser_1) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    SaveUser_1()
}
