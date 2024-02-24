//
//  MissionView_2.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct MissionView_2: View {
    struct CrewMember {
        let astronaut: Astronaut
        let role: String
    }
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        Text(mission.displayName)
        ForEach(crew, id: \.role) { astronaut in
            Text(astronaut.astronaut.name)
            Text(astronaut.role)
            Text(astronaut.astronaut.description)
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
    return MissionView_2(mission: missions[2], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
