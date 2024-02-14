//
//  Instruction_UserDefaults.swift
//  iExpense
//
//  Created by David Stanton on 2/13/24.
//

import SwiftUI

struct Instruction_UserDefaults: View {
    @State private var tap = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap: \(tap)") {
            tap += 1
            
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
        Button("tapCount: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    Instruction_UserDefaults()
}
