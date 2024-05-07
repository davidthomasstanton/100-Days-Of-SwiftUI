//
//  CardView.swift
//  Flashzilla_2
//
//  Created by David Stanton on 5/1/24.
//

import SwiftUI

extension Shape {
    func fill(offset: Double) -> some View {
        if offset == 0 {
            return self.fill(.white)
        } else if offset < 0 {
            return self.fill(.red)
        } else {
            return self.fill(.green)
        }
    }
}
struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    let card: Card
    var removal: ((Bool) -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(
                    accessibilityDifferentiateWithoutColor
                    ? .white
                    : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(offset: offset.width)
                )
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - abs(offset.width / 50.0))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width < 0 {
                            removal?(true)
                        } else {
                            removal?(false)
                            offset = .zero
                        }
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)
        
    }
}

#Preview {
    CardView(card: .example)
}
