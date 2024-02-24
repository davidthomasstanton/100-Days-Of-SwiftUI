//
//  ContentView.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/22/24.
//

import SwiftUI

// constants for astronauts and missions decoded from JSONs in Bundle
// constant for columns of an adaptive number, minimum width of 150
// Display all missions, image, display name formatted launch date
struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show in List Mode", systemImage: "list.dash")
                    } else {
                        Label("Show in Grid Mode", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
