//
//  Activities.swift
//  Habit-Tracking
//
//  Created by David Stanton on 3/5/24.
//

import Foundation

@Observable
class Activities {
    var activities: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "SavedActivities")
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: "SavedActivities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
                activities = decoded
                return
            }
        }
        activities = []
    }
}
