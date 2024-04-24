//
//  SamplePackage_1.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//

import SwiftUI
import SamplePackage

struct SamplePackage_1: View {
    
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    var body: some View {
        Text(results)
    }
}

#Preview {
    SamplePackage_1()
}
