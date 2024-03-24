//
//  User.swift
//  SwiftDataProject_1
//
//  Created by David Stanton on 3/21/24.
//
// ==== User ====
// var: name, city, joinDate

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Nowhere"
    var joinDate: Date = Date.now
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    var unwrappedJobs: [Job] {
        jobs ?? []
    }
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
