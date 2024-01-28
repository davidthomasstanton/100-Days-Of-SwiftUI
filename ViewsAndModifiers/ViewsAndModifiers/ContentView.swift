//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by David Stanton on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            /*
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
             */
        
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundStyle(useRedText ? .red : .blue)
            
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
