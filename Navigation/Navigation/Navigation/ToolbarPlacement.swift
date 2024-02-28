//
//  ToolbarPlacement.swift
//  Navigation
//
//  Created by David Stanton on 2/27/24.
//

import SwiftUI

struct ToolbarPlacement: View {
    var body: some View {
        NavigationStack {
            Text("Hellom ,World!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Click me") {
                            
                        }
                        
                        Button("Or Click Me") {
                            
                        }
                    }
                }
        }
    }
}

#Preview {
    ToolbarPlacement()
}

//                .toolbar {
//                    ToolbarItem(placement: .confirmationAction) {
//                        Button("Tap Me") {
//                            // button action code
//                        }
//                    }
//
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Or Tap Me") {
//                            // button
//                        }
//                    }
//                }
//                .navigationBarBackButtonHidden()
