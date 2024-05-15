//
//  SheetDetents_1.swift
//  SnowSeeker
//
//  Created by David Stanton on 5/14/24.
//

import SwiftUI

struct User_1: Identifiable {
    var id = "Paul Hudson"
}

struct SheetDetents_1: View {
    @State private var user: User_1? = nil
    @State private var isShowingUser = false
    var body: some View {
        Button("Tap for Paul") {
            user = User_1()
        }
        .sheet(item: $user) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
        Button("Alert for Paul") {
            user = User_1()
            isShowingUser = true
        }
        .alert("Alert Title", isPresented: $isShowingUser, presenting: user) { user in
            Button("\(user.id)") { } 
        }
    }
}

#Preview {
    SheetDetents_1()
}
