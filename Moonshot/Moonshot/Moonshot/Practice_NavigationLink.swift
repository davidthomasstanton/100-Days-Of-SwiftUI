//
//  Practice_NavigationLink.swift
//  Moonshot
//
//  Created by David Stanton on 2/19/24.
//

import SwiftUI
// NavigationLink "Tap Me" with smilling face
// List of 100 NavigationLinks with Row details
struct Practice_NavigationLink: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    ForEach(0..<100) { num in
                        NavigationLink {
                            Image(.apolloLiftoff)
                                .resizable()
                                .scaledToFit()
                            Text("Detailed Information")
                        } label: {
                            VStack {
                                Text("Picture \(num)")
                                Image(.apolloLiftoff)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Practice_NavigationLink()
}


//NavigationStack {
//    VStack {
//        NavigationLink {
//            Text("Detailed Information")
//        } label: {
//            Text("Tap Me")
//            Image(systemName: "face.smiling")
//        }
//        .font(.title)
//        
//        List(0..<100) { row in
//            NavigationLink("Row: \(row)") {
//                VStack {
//                    Text("Very Detailed Information")
//                    Image(.moonSalute)
//                        .resizable()
//                        .scaledToFit()
//                        .containerRelativeFrame(.horizontal) { size, axis in
//                            size * 0.8
//                        }
//                }
//            }
//        }
//    }
//    .navigationTitle("Practice NavLink")
//}
