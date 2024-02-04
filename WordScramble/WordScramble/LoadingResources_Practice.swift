//
//  LoadingResources_Practice.swift
//  WordScramble
//
//  Created by David Stanton on 2/2/24.
//

import SwiftUI

struct LoadingResources_Practice: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func loadBundles() -> String {
        if let fileURL = Bundle.main.url(forResource: "some file", withExtension: "txt") {
            if let fileString = try? String(contentsOf: fileURL) {
                return fileString
            }
        }
        return ""
    }
    
    // function testBundles() to load fileURL
    func testBundles() -> String {
        // read in and unwrap a fileURL
        if let fileURL = Bundle.main.url(forResource: "some file", withExtension: "txt") {
            
            // load the fileContents into a string
            if let fileContents = try? String(contentsOf: fileURL) {
                return fileContents
            }
        }
        return ""
    }
}

#Preview {
    LoadingResources_Practice()
}
