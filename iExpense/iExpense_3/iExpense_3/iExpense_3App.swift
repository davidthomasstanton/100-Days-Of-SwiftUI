//
//  iExpense_3App.swift
//  iExpense_3
//
//  Created by David Stanton on 3/26/24.
//
import SwiftData
import SwiftUI

@main
struct iExpense_3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
