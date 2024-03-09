//
//  Practice_AsyncImage_1.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/8/24.
//

import SwiftUI

struct Practice_AsyncImage_1: View {
    var body: some View {
        //AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image.resizable().scaledToFit()
            } else if phase.image != nil {
                Text("Error loading the image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    Practice_AsyncImage_1()
}
