//
//  Activity.swift
//  Habit-Tracking_1
//
//  Created by David Stanton on 3/4/24.
//

import SwiftUI

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var timesCompleted: Int
    
    static let example = Activity(title: "Example Title", description: "Example Description", timesCompleted: 0)
}
