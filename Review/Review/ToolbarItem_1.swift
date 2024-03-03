//
//  ToolbarItem_1.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import SwiftUI

struct ToolbarItem_1: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Tap Me") {
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("No, Tap Me") {
                        
                    }
                }       
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Tap me?") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ToolbarItem_1()
}
