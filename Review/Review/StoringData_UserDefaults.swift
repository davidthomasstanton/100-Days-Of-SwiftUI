//
//  StoringData_UserDefaults.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct StoringData_UserDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    StoringData_UserDefaults()
}
