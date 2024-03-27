//
//  iExpense_4App.swift
//  iExpense_4
//
//  Created by David Stanton on 3/26/24.
//
import SwiftData    
import SwiftUI

@main
struct iExpense_4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
