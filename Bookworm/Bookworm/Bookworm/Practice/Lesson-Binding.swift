//
//  Lesson-Binding.swift
//  Bookworm
//
//  Created by David Stanton on 3/14/24.
//

import SwiftUI
struct PushButton_1: View {
    var title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.green]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button {
            isOn.toggle()
        } label: {
            Text(title)
                .padding()
                .foregroundStyle(.white)
                .background(LinearGradient(colors: (isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
                .clipShape(.capsule)
        }
    }
}
struct Lesson_Binding: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton_1(title: "Push Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    Lesson_Binding()
}
