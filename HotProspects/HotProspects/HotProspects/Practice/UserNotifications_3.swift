//
//  UserNotifications_3.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//

import SwiftUI
import UserNotifications

struct UserNotifications_3: View {
    
    var body: some View {
        Button("Authorize Notifications") {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("Good to go!")
                } else if let error {
                    print(error.localizedDescription)
                }
            }
        }
        Button("Schedule Notifications") {
            // content
            let content = UNMutableNotificationContent()
            content.title = "Make the Coffee"
            content.subtitle = "Baby needs the coffee"
            content.sound = UNNotificationSound.defaultRingtone
            
            // trigger
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            // request
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
            
        }
    }
}

#Preview {
    UserNotifications_3()
}
