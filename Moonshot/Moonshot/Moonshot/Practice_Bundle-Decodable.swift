//
//  Practice_Bundle-Decodable.swift
//  Moonshot
//
//  Created by David Stanton on 2/20/24.
//

import Foundation
// extension of Bundle
// function that decodes a generic
extension Bundle {
    func decode2<T: Codable>(_ file: String) -> T {
        // load url
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError()
        }
        // load data
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        // create decoder, date formatter and format dates
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        // decode and return data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError()
        }
        return loaded
    }
}
