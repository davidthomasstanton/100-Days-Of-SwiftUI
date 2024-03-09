//
//  Practice_URLSession_2.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/8/24.
//

import SwiftUI
struct Response_2: Codable {
    var results = [Result_2]()
}

struct Result_2: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Practice_URLSession_2: View {
    @State private var results = [Result_2]()
    
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
            print("Failed to get URL")
            return
        }
        
        // get data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode and assign
            if let decodedData = try? JSONDecoder().decode(Response_2.self, from: data) {
                results = decodedData.results
            }
        } catch {
            print("Failed to get data from url")
        }
                
    }
}

#Preview {
    Practice_URLSession_2()
}
