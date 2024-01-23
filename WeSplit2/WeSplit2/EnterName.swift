//
//  EnterName.swift
//  WeSplit2
//
//  Created by David Stanton on 1/23/24.
//

import SwiftUI

struct EnterName: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name: ", text: $name)
            Text("Hello \(name)!")
        }
    }
}

#Preview {
    EnterName()
}
