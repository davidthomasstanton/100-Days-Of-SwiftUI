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
    
    // function to load fileURL
    func testBundles() -> String {
        // read in and unwrap a fileURL
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            
            // load the fileContents into a string
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string
                return fileContents
            }
        }
        return ""
    }
}

#Preview {
    LoadingResources_Practice()
}
