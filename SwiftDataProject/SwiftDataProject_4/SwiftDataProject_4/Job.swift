//
//  Job.swift
//  SwiftDataProject_4
//
//  Created by David Stanton on 3/23/24.
//
// ==== Job ====
// var: name, priority, owner is an optional User
import Foundation
import SwiftData

@Model
class Job {
    var name: String = "Work"
    var priority: Int = 1
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
