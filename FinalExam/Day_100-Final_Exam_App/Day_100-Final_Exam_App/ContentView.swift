//
//  ContentView.swift
//  Day_100-Final_Exam_App
//
//  Created by David Stanton on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    var message = "some text"
    @State private var isShowing = false
    @State private var arrayData: [Int] = [1, 2, 3, 4]
    @State private var animationAmount = 1.0
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .fixedSize(horizontal: true, vertical: false)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .font(.largeTitle)
                .frame(width: 30)
            Text("Hello, world!")
                .foregroundStyle(.black)
                
            Button("Alert") {
                isShowing = true
            }
            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
            
            HStack(alignment: .firstTextBaseline) {
                Text("Hello")
                    .font(.title)
                Text("World")
                    .font(.body)
            }
            
            List(arrayData, id: \.self) {
                Text("\($0)")
                    .foregroundStyle(.black)
            }
        
            
            Button("Tap Me") {
                withAnimation(.default) {
                    animationAmount += 1
                }
            }
            .disabled(isShowing)
            .padding()
            .background(.blue)
            .scaleEffect(animationAmount)
            .blur(radius: 3.0)
            
            
        }
        .padding()
        .accessibilityLabel("Hello, World")
        .background(.gray)
        .accessibilityElement(children: .ignore)
        .foregroundStyle(.white)
        .alert("Alert", isPresented: $isShowing) {
            Button("OK") { }
        }
        .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
