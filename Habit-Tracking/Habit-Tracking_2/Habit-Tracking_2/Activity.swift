//
//  Activity.swift
//  Habit-Tracking_2
//
//  Created by David Stanton on 3/6/24.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var timesCompleted: Int
    
    static var example = Activity(name: "Example Name", description: "Example Description", timesCompleted: 0)
}

