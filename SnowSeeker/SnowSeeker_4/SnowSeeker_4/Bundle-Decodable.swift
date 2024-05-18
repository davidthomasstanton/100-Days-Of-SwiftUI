//
//  Bundle-Decodable.swift
//  SnowSeeker_4
//
//  Created by David Stanton on 5/17/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file) in Bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from Bundle")
        }
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.valueNotFound(let value, let context) {
            fatalError("Failed to load \(file) from Bundle. Value \(value) not found - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to load \(file) from Bundle. Data corrupted - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            fatalError("Failed to load \(file) from Bundle. Type \(type) mismatch - \(context.debugDescription)")
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to load \(file) from Bundle. Key \(key) not found - \(context.debugDescription)")
        } catch {
            fatalError("Failed to load \(file) from Bundle. \(error.localizedDescription)")
        }
    }
}
