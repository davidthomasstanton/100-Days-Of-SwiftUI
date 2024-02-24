//
//  MissionView_3.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct MissionView_3: View {
    struct CrewMember {
        let astronaut: Astronaut
        let role: String
    }
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        Text(mission.displayName)
        Text(mission.formattedLaunchDate)
        
        Text("Crew")
        ScrollView(.horizontal) {
            HStack {
                ForEach(crew, id: \.role) { member in
                    VStack {
                        Image(member.astronaut.id)
                        Text(member.astronaut.name)
                        Text(member.role)
                    }
                }
            }
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
    return MissionView_3(mission: missions[3], astronauts: astronauts)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
