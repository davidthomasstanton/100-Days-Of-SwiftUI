//
//  CustomDivider.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2.0)
            .foregroundStyle(.lightBackground)
            .padding(.vertical, 5)
    }
}

#Preview {
    CustomDivider()
}
