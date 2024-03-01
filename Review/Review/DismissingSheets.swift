//
//  DismissingSheets.swift
//  Review
//
//  Created by David Stanton on 2/29/24.
//

import SwiftUI


struct ThirdView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct DismissingSheets: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            showingSheet = true
        }
        .sheet(isPresented: $showingSheet) {
            ThirdView()
        }
    }
}

#Preview {
    DismissingSheets()
}
