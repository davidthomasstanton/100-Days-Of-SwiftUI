//
//  CrewRoster.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct CrewRoster: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 104, height: 72)
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(.lightBackground, lineWidth: 2)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(crewMember.role)
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(5)
                    }
                }
            }
        }
    }
}

#Preview {
    CrewRoster(crew: [])
}
