//
//  AstronautView.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 25.0))
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(.lightBackground)
                        }
                        .padding(.vertical)
                    
                    Text(astronaut.description)
                }
                .padding()
            }
            .navigationTitle(astronaut.name)
            .background(.darkBackground)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["white"]!)
        .preferredColorScheme(.dark)
}
