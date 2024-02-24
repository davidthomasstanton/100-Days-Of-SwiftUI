//
//  MissionView.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/22/24.
//

import SwiftUI
// struct for Mission view that has mission, and crew of type...
// nested struct for CrewMember that has role and astronaut
// ScrollView with the image of the patch
// Mission Highlights & description
// Crew in a H scrolling Stack
// initiation of mission and crew
struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { size, axis in
                            size * 0.6
                        }
                    
                    Text(mission.fullLaunchDate)
                        .font(.body.italic())
                    
                    CustomDivider()
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .foregroundStyle(.white)
                            .padding(.vertical, 5)
                        Text(mission.description)
                            .font(.body)
                            .padding(.vertical, 5)
                        
                        CustomDivider()
                    }
                    CrewRoster(crew: crew)
                }
                .padding(.horizontal)
            }
            .background(.darkBackground)
            //.navigationTitle(mission.displayName)
            //.navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut: Astronaut = astronauts[member.name] {
                return CrewMember(astronaut: astronaut, role: member.role)
            } else {
                fatalError()
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
