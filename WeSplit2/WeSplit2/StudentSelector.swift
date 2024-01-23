//
//  SwiftUIView.swift
//  WeSplit2
//
//  Created by David Stanton on 1/23/24.
//

import SwiftUI

struct StudentPickerView: View {
    let students = ["Harry", "Ron", "Hermoine"]
    @State private var selectedStudent = "Hermoine"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select a student: ", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Student Selector")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    StudentPickerView()
}
