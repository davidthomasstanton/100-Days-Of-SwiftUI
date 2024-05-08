//
//  CardView.swift
//  Flashzilla_4
//
//  Created by David Stanton on 5/7/24.
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

struct CardView: View {
    @State private var offset = CGSize.zero
    @State private var isShowingAnswer = false
    let card: Card
    var removal: ((Bool) -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(.white.opacity(1 - Double(abs(offset.width / 50))))
                .background(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(offsetAmt: offset.width)
                )
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(offset.width / 50))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
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

extension Shape {
    func fill(offsetAmt: Double) -> some View {
        if offsetAmt == 0 {
            return self.fill(.white)
        } else if offsetAmt > 0 {
            return self.fill(.green)
        } else {
            return self.fill(.red)
        }
    }
}

#Preview {
    CardView(card: Card.example)
}
