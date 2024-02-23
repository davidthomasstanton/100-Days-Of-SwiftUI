//
//  Bundle-Decodable.swift
//  Moonshot_p1
//
//  Created by David Stanton on 2/22/24.
//

import Foundation
// extension of Bundle
// function that decodes a generic
// load the url
// get the data
// create decoder and format dates
// decode and return data
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not get url from \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not get data from \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode from \(file) in bundle.")
        }
        
        return loaded
    }
}
