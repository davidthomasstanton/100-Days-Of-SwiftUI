//
//  GridItem_2.swift
//  Review
//
//  Created by David Stanton on 3/1/24.
//

import SwiftUI

struct GridItem_2: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            
        }
    }
}

#Preview {
    GridItem_2()
}
