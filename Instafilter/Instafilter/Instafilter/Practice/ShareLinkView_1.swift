//
//  ShareLinkView_1.swift
//  Instafilter
//
//  Created by David Stanton on 4/2/24.
//

import SwiftUI

struct ShareLinkView_1: View {
    var body: some View {
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Share Link"), message: Text("Spread the good news about learning!"))
        let example = Image(.example)
        ShareLink("Share an image", item: example, preview: SharePreview("Singapore Airline", image: example))
    }
}

#Preview {
    ShareLinkView_1()
}
