//
//  FetchReadings_3.swift
//  HotProspects
//
//  Created by David Stanton on 4/22/24.
//
// Fetch readings from "https://hws.dev/readings.json" and display the number if successful
import SwiftUI

struct FetchReadings_3: View {
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
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "There are \(readings.count) readings"
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
    FetchReadings_3()
}
