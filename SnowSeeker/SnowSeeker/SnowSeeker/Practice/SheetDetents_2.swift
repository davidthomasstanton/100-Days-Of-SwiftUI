//
//  SheetDetents_2.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

struct User_2: Identifiable {
    var id = "Rudyard Jonald Kipling"
}

struct SheetDetents_2: View {
    @State private var user: User_2? = nil
    @State private var isShowingUser = false
    var body: some View {
        Button("Tap for The Mayor of Burnside") {
            user = User_2()
        }
        .sheet(item: $user) { user in
            Text("May I present, \(user.id).")
                .presentationDetents([.medium, .large])
        }
        Button("Alert for Kip") {
            user = User_2()
            isShowingUser = true
        }
        .alert("Calling all cats and humans!", isPresented: $isShowingUser, presenting: user) { user in
            Button("It is \(user.id)") { }
        }
    }
}

#Preview {
    SheetDetents_2()
}
