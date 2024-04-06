//
//  DocumentsDirectoryView_.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//
// Create a button that converts a message into Data
// writes it into the documentsDirectory then reads it out
import SwiftUI

struct DocumentsDirectoryView_: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Hey kids, stay in school!".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let output = try String(contentsOf: url)
                print(output)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    DocumentsDirectoryView_()
}
