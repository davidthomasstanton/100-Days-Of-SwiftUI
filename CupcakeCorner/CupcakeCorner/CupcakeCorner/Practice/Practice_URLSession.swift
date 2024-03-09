//
//  Practice_URLSession.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/8/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Practice_URLSession: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { result in
            VStack(alignment: .leading) {
                Text(result.trackName)
                    .font(.title)
                Text(result.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        // create url
        // fetch data from url
        // decode into Response struct
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    Practice_URLSession()
}
