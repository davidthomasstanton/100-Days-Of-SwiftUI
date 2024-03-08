//
//  Activity.swift
//  Habit-Tracking_3
//
//  Created by David Stanton on 3/7/24.
//

import Foundation
import SwiftUI

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var completionCount: Int
    
    static var example = Activity(name: "Example name", description: "Example Description", completionCount: 0)
}
