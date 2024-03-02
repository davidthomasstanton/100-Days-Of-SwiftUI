//
//  GridItem_1.swift
//  Review
//
//  Created by David Stanton on 3/1/24.
//

import SwiftUI

struct GridItem_1: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    GridItem_1()
}
