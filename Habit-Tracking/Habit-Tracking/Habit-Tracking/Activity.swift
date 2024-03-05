//
//  Activity.swift
//  Habit-Tracking
//
//  Created by David Stanton on 3/4/24.
//

import Foundation

struct Activity: Codable, Equatable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Exammple Activity", description: "This is a test activity")
    
    
}
