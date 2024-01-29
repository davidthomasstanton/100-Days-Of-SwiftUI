//
//  ViewsPractice.swift
//  ViewsAndModifiers
//
//  Created by David Stanton on 1/29/24.
//

import SwiftUI

struct BigTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding(20)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func bigTitleStyle() -> some View {
        modifier(BigTitle())
    }
}

struct WatermarkMore: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack (alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.white)
                .padding(30)
                .background(.gray)
        }
    }
}

extension View {
    func watermarkMoreStyle(with text: String) -> some View {
        modifier(WatermarkMore(text: text))
    }
}

struct ViewsPractice: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .bigTitleStyle()
        Color.white
            .watermarkMoreStyle(with: "watermark")
    }
}

#Preview {
    ViewsPractice()
}
