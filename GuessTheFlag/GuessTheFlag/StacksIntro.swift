//
//  StacksIntro.swift
//  GuessTheFlag
//
//  Created by David Stanton on 1/24/24.
//

import SwiftUI

struct StacksIntro: View {
    var body: some View {
        VStack {
            HStack {
                Text("1").padding().border(Color.black)
                Text("2").padding().border(Color.black)
                Text("3").padding().border(Color.black)
            }
            HStack {
                Text("4").padding().border(Color.black)
                Text("5").padding().border(Color.black)
                Text("6").padding().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
            HStack {
                Text("7").padding().border(Color.black)
                Text("8").padding().border(Color.black)
                Text("9").padding().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    StacksIntro()
}
