//
//  ShareLinkView_.swift
//  Instafilter
//
//  Created by David Stanton on 4/2/24.
//

import SwiftUI

struct ShareLinkView_: View {
    var body: some View {
        ShareLink(item: URL(string: "https://www.hackingwithSwift.com")!) {
            Label("Share a link", systemImage: "airplane")
        }
        let example = Image(.example)
        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Share an image", systemImage: "photo")
        }
    }
}

#Preview {
    ShareLinkView_()
}
