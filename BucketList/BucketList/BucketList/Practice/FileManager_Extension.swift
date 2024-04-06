//
//  FileManager_Extension.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//

import Foundation

extension FileManager {
    static func write(_ message: String, at path: String) {
        let data = Data(message.utf8)
        let url = URL.documentsDirectory.appending(path: path)
        
        do {
            try data.write(to: url, options: [.atomic, .completeFileProtection])
            print("File Write successful.")
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    static func read(path: String) -> String {
        do {
            let url = URL.documentsDirectory.appending(path: path)
            let output = try String(contentsOf: url)
            return output
        } catch {
            print(error.localizedDescription)
            return "File Read not successful"
        }
    }
}
