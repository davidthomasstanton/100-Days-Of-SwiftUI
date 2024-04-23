//
//  FetchReadings_1.swift
//  HotProspects
//
//  Created by David Stanton on 4/22/24.
//
// Fetch readings from "https://hws.dev/readings.json" and display the number if successful
// func fetchReadings()
// async function that creates a computed property for Task (fetchTask) that
// gets the url, gets the data from it, decodes the readings, returns the count of readings
// gets the result of the task, on a switch sets the output for success or failure
import SwiftUI

struct FetchReadings_1: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Double].self, from: data)
            return "There are \(decoded.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    FetchReadings_1()
}
