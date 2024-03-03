//
//  DecodeExtension.swift
//  Review
//
//  Created by David Stanton on 3/2/24.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> String {
        guard let url = self.url(forResource: file, withExtension: "") else {
            fatalError("Could not get URL from bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not get data from url")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(String.self, from: data) else {
            fatalError("Could not decode data from url")
        }
        
        return loaded
    }
}
