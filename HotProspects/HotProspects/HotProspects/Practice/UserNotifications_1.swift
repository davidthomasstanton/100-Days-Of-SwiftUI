//
//  UserNotifications_1.swift
//  HotProspects
//
//  Created by David Stanton on 4/23/24.
//

import SwiftUI
import UserNotifications

struct UserNotifications_1: View {
    var body: some View {
        VStack {
            Button("Request Notifications") {
                //
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notificaitons") {
                // content
                let content = UNMutableNotificationContent()
                content.title = "Feed Kip and Jules"
                content.subtitle = "They're hunnngry"
                content.sound = UNNotificationSound.default
                
                // trigger
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // request
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    UserNotifications_1()
}
