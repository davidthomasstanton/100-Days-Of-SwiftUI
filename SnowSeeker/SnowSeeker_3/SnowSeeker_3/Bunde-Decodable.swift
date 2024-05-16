//
//  Bunde-Decodable.swift
//  SnowSeeker_3
//
//  Created by David Stanton on 5/15/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = url.self(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file) in Bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in Bundle")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.valueNotFound(let value, let context) {
            fatalError("Failed to load \(file) in Bundle, \(value) not found - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to load \(file) in Bundle, data corrupted")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Failed to load \(file) in Bundle, \(type) mismatch - \(context.debugDescription)")
        } catch {
            fatalError("Failed to load \(file) in Bundle, \(error.localizedDescription)")
        }
    }
}
