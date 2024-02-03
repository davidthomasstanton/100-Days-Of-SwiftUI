//
//  LoadingResources.swift
//  WordScramble
//
//  Created by David Stanton on 2/2/24.
//

import SwiftUI

struct LoadingResources: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
   
    var body: some View {
        VStack {
            
        }
        .padding()
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
    LoadingResources()
}
