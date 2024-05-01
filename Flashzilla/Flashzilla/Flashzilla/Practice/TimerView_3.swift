//
//  TimerView_3.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct TimerView_3: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 4 {
                    timer.upstream.connect().cancel()
                }
                print("Time is now \(time)")
                counter += 1
            }
    }
}

#Preview {
    TimerView_3()
}
