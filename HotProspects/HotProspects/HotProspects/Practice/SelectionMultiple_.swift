//
//  SelectionMultiple_.swift
//  HotProspects
//
//  Created by David Stanton on 4/22/24.
//

import SwiftUI

struct SelectionMultiple_: View {
    var coWorkers = ["Michael", "Brody", "Rebecca", "Armando"]
    @State private var selection = Set<String>()
    var body: some View {
        List(coWorkers, id: \.self, selection: $selection) { person in
            Text(person)
        }
        EditButton()
        
        if selection.isEmpty == false {
            Text("You have selected \(selection.formatted())")
        }
    }
}

#Preview {
    SelectionMultiple_()
}
