//
//  ColorGradients.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct ColorGradients: View {
    var body: some View {
        ZStack {
            //LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            /*
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.15),
                Gradient.Stop(color: .black, location: 0.85),
            ], startPoint: .top, endPoint: .bottom)
            */
            
            /*
            LinearGradient(stops: [
                .init(color: .blue, location: 0.13),
                .init(color: .black, location: 0.85),
            ], startPoint: .top, endPoint: .bottom)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
             */
            
            /*
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 400)
            */
            /*
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            */
            Text("Halloooo")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.indigo.gradient)

        }
        .ignoresSafeArea()
    }
}

#Preview {
    ColorGradients()
}
