//
//  AstronautView.swift
//  Moonshot
//
//  Created by David Stanton on 2/23/24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    //@Binding var pathStore: PathStore
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 25.00))
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(.lightBackground)
                        }
                        .padding(.vertical)
                    Text(astronaut.description)
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle(astronaut.name)
            .background(.darkBackground)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["armstrong"]!)
        .preferredColorScheme(.dark)
}
