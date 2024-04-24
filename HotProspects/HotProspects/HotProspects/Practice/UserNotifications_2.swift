//
//  UserNotifications_2.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//

import SwiftUI
import UserNotifications

struct UserNotifications_2: View {
    var body: some View {
        VStack {
            Button("Request Authorization") {
                //
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notifications") {
                // content
                let content = UNMutableNotificationContent()
                content.title = "Feed the meter"
                content.subtitle = "You've been parked too long"
                content.sound = UNNotificationSound.defaultCritical
                
                // trigger
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // request
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                
            }
        }
    }
}

#Preview {
    UserNotifications_2()
}
