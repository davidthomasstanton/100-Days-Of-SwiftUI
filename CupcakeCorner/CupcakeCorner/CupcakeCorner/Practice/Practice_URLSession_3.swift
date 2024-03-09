//
//  Practice_URLSession_3.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/8/24.
//

import SwiftUI

struct Response_3: Codable {
    var results: [Result_3]
}
struct Result_3: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Practice_URLSession_3: View {
    @State private var results = [Result_3]()
    
    var body: some View {
        List(results, id: \.trackId) { result in
            VStack(alignment: .leading) {
                Text(result.trackName)
                    .font(.title)
                Text(result.collectionName)
                    .font(.body)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        // get url
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Error getting url")
            return
        }
        
        // get data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // decode and assign
            if let decoded = try? JSONDecoder().decode(Response_3.self, from: data) {
                results = decoded.results
            }
        } catch {
            print("Error getting data from url")
        }
    }
}

#Preview {
    Practice_URLSession_3()
}
