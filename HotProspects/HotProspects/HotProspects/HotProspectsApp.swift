//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by David Stanton on 4/22/24.
//
import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            //SelectionMultiple_()
            //TabView_1()
            //FetchReadings_2()
            //UserNotifications_1()
            //UserNotifications_2()
            //UserNotifications_3()
        }
        .modelContainer(for: Prospect.self)
    }
}
