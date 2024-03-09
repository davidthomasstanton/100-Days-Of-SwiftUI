//
//  Practice_URLSession_1.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/8/24.
//

import SwiftUI

struct Response_1: Codable {
    var results = [Result_1]()
}
struct Result_1: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Practice_URLSession_1: View {
    @State private var results = [Result_1]()
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
            await LoadTracks()
        }
    
    }
    func LoadTracks() async {
        // get the url
        // get the tuple data
        // decode and assign
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode(Response_1.self, from: data) {
                results = decodedData.results
            }
            
        } catch {
            print("Error getting data from the url")
        }
    }
}

#Preview {
    Practice_URLSession_1()
}
