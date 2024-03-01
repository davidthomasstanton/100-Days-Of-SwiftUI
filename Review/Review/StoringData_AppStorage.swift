//
//  StoringData_AppStorage.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct StoringData_AppStorage: View {
    @AppStorage("tapCount") private var tapCount = 0
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    StoringData_AppStorage()
}
