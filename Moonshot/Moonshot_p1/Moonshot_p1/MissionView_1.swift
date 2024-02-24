//
//  MissionView_1.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct MissionView_1: View {
    struct CrewMember {
        let astronaut: Astronaut
        let role: String
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        Text(mission.displayName)
        Text(crew[0].astronaut.name)
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
    return MissionView_1(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
