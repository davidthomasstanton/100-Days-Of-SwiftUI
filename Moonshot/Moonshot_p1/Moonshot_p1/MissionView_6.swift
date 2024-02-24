//
//  MissionView_6.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct MissionView_6: View {
    struct CrewMember {
        let astronaut: Astronaut
        let role: String
    }
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
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
    return MissionView_6(mission: missions[6], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
