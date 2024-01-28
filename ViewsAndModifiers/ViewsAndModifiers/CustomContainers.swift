//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by David Stanton on 1/27/24.
//

import SwiftUI


struct CustomContainers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .titleStyle()
        //Color.gray
            //.watermarked(with: "This is gray")

    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        ZStack (alignment: .bottomTrailing) {
            content
                .font(.largeTitle)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    CustomContainers()
}
