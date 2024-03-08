//
//  Activities.swift
//  Habit-Tracking_3
//
//  Created by David Stanton on 3/7/24.
//

import Foundation
import SwiftUI

@Observable
class Activities {
    var activities = [Activity]() {
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
}
