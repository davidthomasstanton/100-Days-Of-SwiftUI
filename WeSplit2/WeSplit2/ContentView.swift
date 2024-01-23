//
//  ContentView.swift
//  WeSplit2
//
//  Created by David Stanton on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermoine", "Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        NavigationStack {
            Section {
                Form {
                    Picker("Select a student: ", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
