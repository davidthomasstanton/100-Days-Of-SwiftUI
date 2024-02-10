//
//  Review_1.swift
//  MultiplicationGame
//
//  Created by David Stanton on 2/8/24.
//

import SwiftUI

struct Review_1: View {
    @State private var userNum = Int()
    @State private var userDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack() {
                
                // Read numbers from users with Stepper, including using its shorter
                // form when your label is a simple text view
                Stepper("Increment or Decrement", value: $userNum, in: 0...10)
                Text("User Number: \(userNum)")
                
                // Letting the user enter dates using DatePicker, including the
                // displayedComponents parameter to control dates or times
                DatePicker("Choose a Date", selection: $userDate, displayedComponents: .date)
                Text("User Date: \(userDate.formatted(date: .abbreviated, time: .omitted))")
                
                // Working with dates in Swift, using Date, DateComponents, and
                // Date Formatter
                /*
                var components = Calendar.current.dateComponents([.year, .month, .day], from: userDate)
                let year = components.year ?? 0
                let day = components.day ?? 0
                Text("Today's date: \(Date.now, format: .dateTime.month().day().year())")
                 */

                // Bring in machine learning
                
                // Scrolling tables of data using List, in particular how it can
                // create rows directly from arrays of data
                List(0..<1) {
                    Text("\($0)")
                }
                
                List {
                    ForEach(0..<2) {
                        Text("\($0 + Int.random(in: 0...23))")
                    }
                }
                
                // Running code when a view is shown, using onAppear()
                
                // Reading files from our app bundle by looking up their path
                // using the Bundle class, including loading strings from there
                
                // Crashing your code with fatalError()
                
                // Check whether a string is spelled correctly using UITextChecker
                
                // Creating animations implicitly using the animation() modifier
                
                // Customizing animations with delays and repeats, and choosing
                // between ease-in-ease-out vs spring animations
                
                // Attaching the animation() mofidier to bindings, so we can
                // animate changes directly from UI controls
                
                // Using withAnimation() to create explicit animations
                
                // Attaching multiple animation() modifiers to a single view so
                // that we can control the animation stack
                
                // using DragGesture() to let the user move views around, then
                // snapping them back to their original location
                
                // Using SwiftUI's built-in transitions, and creating your own
                
                
            }
            .navigationTitle("SwiftUI Review")
        }
    }
}

#Preview {
    Review_1()
}
