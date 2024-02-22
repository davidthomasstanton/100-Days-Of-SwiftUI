//
//  Practice_MissionView.swift
//  Moonshot
//
//  Created by David Stanton on 2/21/24.
//

import SwiftUI

struct Practice_MissionView: View {
    let mission: Mission
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 5)
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    return Practice_MissionView(mission: missions[0])
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
