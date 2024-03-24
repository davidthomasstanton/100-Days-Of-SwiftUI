//
//  User.swift
//  SwiftDataProject_5
//
//  Created by David Stanton on 3/23/24.
//
// ==== User ====
// var: name, city, joinDate & assign default values
// assign a jobs variable with a relationship delete rule of cascade
// unwrapped jobs with nill coallescing
import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Somewhere"
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
