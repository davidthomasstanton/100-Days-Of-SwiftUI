//
//  CustomComparableConformance_.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//

import SwiftUI

struct User_1: Comparable, Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User_1, rhs: User_1) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct CustomComparableConformance_: View {
    let users = [
        User_1(firstName: "Brody", lastName: "Brooks"),
        User_1(firstName: "Matt", lastName: "Korba"),
        User_1(firstName: "Michael", lastName: "Annetta")
    ].sorted()
    
    var body: some View {
        List(users) { user in 
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

#Preview {
    CustomComparableConformance_()
}
