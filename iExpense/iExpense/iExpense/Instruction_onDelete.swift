//
//  Instruction_onDelete.swift
//  iExpense
//
//  Created by David Stanton on 2/12/24.
//

import SwiftUI

struct Instruction_onDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id:\.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    Instruction_onDelete()
}
