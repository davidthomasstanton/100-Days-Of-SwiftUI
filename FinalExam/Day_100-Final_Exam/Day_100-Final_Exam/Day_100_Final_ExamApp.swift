//
//  Day_100_Final_ExamApp.swift
//  Day_100-Final_Exam
//
//  Created by David Stanton on 5/18/24.
//

import SwiftUI

@main
struct Day_100_Final_ExamApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: Day_100_Final_ExamDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
