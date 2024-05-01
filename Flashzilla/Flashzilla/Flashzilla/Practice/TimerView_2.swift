//
//  TimerView_2.swift
//  Flashzilla
//
//  Created by David Stanton on 4/30/24.
//

import SwiftUI

struct TimerView_2: View {
    let timer = Timer.publish(every: 1, tolerance: 1.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 4 {
                    timer.upstream.connect().cancel()
                    printCancel()
                }
                print("The timer is at \(time)")
                counter += 1
            }
    }
    func printCancel() {
        print("The timer has been cancelled")
    }
}

#Preview {
    TimerView_2()
}
