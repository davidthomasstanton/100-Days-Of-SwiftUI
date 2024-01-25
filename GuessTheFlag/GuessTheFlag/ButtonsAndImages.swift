//
//  ButtonsAndImages.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/25/24.
//

import SwiftUI

struct ButtonsAndImages: View {
    var body: some View {
        
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
        
        Button {
            print("Button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
        }
        /*
        Button() {
            print("Button was tapped")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
         */
        
        /*
        VStack{
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) {}
                .buttonStyle(.bordered)
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
        }
        */
    }
    
    func executeDelete() {
        print("now deleting...")
    }
}

#Preview {
    ButtonsAndImages()
}
