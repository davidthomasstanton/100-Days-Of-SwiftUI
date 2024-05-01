//
//  TimerView_1.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct TimerView_1: View {
    @State private var counter = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 4 {
                    timer.upstream.connect().cancel()
                    print("Timer has been canceled")
                }
                print("The time is \(time)")
                counter += 1
            }
    }
}

#Preview {
    TimerView_1()
}
