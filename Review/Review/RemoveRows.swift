//
//  RemoveRows.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI

struct RemoveRows: View {
    @State private var numbers = [Int]()
    @State private var currentNum = 1
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Row") {
                    numbers.append(currentNum)
                    currentNum += 1
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
    RemoveRows()
}
