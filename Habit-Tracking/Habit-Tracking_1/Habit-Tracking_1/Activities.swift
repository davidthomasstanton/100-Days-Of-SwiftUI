//
//  Activities.swift
//  Habit-Tracking_1
//
//  Created by David Stanton on 3/4/24.
//

import SwiftUI

@Observable
class Activities: Codable, Identifiable {
    var activities: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "SavedActivities")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedActivities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: data) {
                activities = decoded
                return
            }
        }
        activities = []
    }
    
    
    func addActivity(title: String, description: String) {
        let newActivity = Activity(title: title, description: description, timesCompleted: 0)
        activities.append(newActivity)
    }
}
