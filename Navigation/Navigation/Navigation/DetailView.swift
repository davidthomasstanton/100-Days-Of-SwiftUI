//
//  DetailView.swift
//  Navigation
//
//  Created by David Stanton on 2/24/24.
//

import SwiftUI

struct DetailView: View {
    
    var number: Int
    var body: some View {
        Text("Details of \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    DetailView(number: 558)
}
