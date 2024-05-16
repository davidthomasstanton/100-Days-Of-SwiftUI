//
//  Bundle-Decodable.swift
//  SnowSeeker_1
//
//  Created by David Stanton on 5/15/24.
//
// extension of Bundle
// takes a string and tries to decode a generic Decoable
// gets Self.url from file, gets data from url
// creates a decoder and returns the generic decodable from data
// handle all possible errors
import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) from the bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.valueNotFound(let value, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(value) - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it is not a valid JSON")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to a type mismatch - \(context.debugDescription)")
        } catch DecodingError.keyNotFound(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key - \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
        
    }
}
