//
//  DocumentsDirectoryView_2.swift
//  BucketList
//
//  Created by David Stanton on 4/5/24.
//

import SwiftUI

struct DocumentsDirectoryView_2: View {
    var body: some View {
        Button("Third time's...") {
            let data = Data("...a charm".utf8)
            let url = URL.documentsDirectory.appending(path: "keepAtIt.txt")
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
    DocumentsDirectoryView_2()
}
