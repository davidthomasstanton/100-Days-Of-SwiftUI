//
//  CustomComparableConformance_2.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//

import SwiftUI

struct User_2: Comparable, Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User_2, rhs: User_2) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct CustomComparableConformance_2: View {
    
    let users = [
        User_2(firstName: "Ally", lastName: "Weiss"),
        User_2(firstName: "Cherise", lastName: "Higara?"),
        User_2(firstName: "Erik", lastName: "...you should know this")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomComparableConformance_2()
}
