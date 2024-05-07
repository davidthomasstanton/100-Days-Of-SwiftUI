//
//  CardView.swift
//  Flashzilla
//
//  Created by David Stanton on 5/1/24.
//
// extension on Shape
// function fill() that returns a fill of white, green, or red
// CardView
// RoundedRectangle that reveals the background the further from center it gets
// background is white, green, or red depending on right/wrong
// Prompt and Answer if isShowingAnswer
// frame of 450/250
// rotation is the degrees offset / 5
// x value is offset amount * 5
// the opacity becomes clear as it gets toward the edges
// add a DragGesture() that sets the offset to the gesture's translation
// when the gesture has ended, check of the offset amount is more than 100
// if right, remove, if left, add, if less than 100, snap it back
// tapGesture to show answer
// animation is bouncy

import SwiftUI
extension Shape {
    func fill(offset: Double) -> some View {
        if offset == 0 {
            return self.fill(.white)
        } else if offset > 0 {
            return self.fill(.green)
        } else {
            return self.fill(.red)
        }
    }
}
struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @State private var offset = CGSize.zero
    @State private var isShowingAnswer = false
    let card: Card
    var removal: ((Bool) -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor 
                    ? .white
                    : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25)
                        .fill(offset: offset.width)
                )
                .shadow(radius: 10)
            
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
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5.0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            removal?(false)
                        } else {
                            removal?(true)
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
