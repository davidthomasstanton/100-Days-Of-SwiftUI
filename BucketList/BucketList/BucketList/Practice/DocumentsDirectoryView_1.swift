//
//  DocumentsDirectoryView_1.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//

import SwiftUI

struct DocumentsDirectoryView_1: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("That's why you always leave a note.".utf8)
            let url = URL.documentsDirectory.appending(path: "lifeLesson.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    DocumentsDirectoryView_1()
}
