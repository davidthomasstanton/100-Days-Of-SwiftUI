//
//  Instruction_Sheets.swift
//  iExpense
//
//  Created by David Stanton on 2/12/24.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct Instruction_Sheets: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            
        }
    }
}

#Preview {
    Instruction_Sheets()
}
