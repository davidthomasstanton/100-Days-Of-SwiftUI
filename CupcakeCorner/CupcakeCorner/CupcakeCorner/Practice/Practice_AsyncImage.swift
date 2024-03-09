//
//  Practice_AsyncImage.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/8/24.
//

import SwiftUI

struct Practice_AsyncImage: View {
    var body: some View {
        // load a remote image
        //AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
        
        // load a remote image that you can resize
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
               .resizable()
               .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        
        // load a remote image with phase control
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.image != nil {
                Text("There was an error loading the image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    Practice_AsyncImage()
}
