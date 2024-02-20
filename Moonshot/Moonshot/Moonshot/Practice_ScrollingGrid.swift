//
//  Practice_ScrollingGrid.swift
//  Moonshot
//
//  Created by David Stanton on 2/19/24.
//

import SwiftUI
// A thousand items in three fixed columns
// A thousand items in an adaptive amount of columns
// A thousand items in with an adaptive amount of columns scrolling horizontally
struct Practice_ScrollingGrid: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80)) ]
    let layout2 = [ GridItem(.adaptive(minimum: 20, maximum: 120)) ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout2) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    Practice_ScrollingGrid()
}
