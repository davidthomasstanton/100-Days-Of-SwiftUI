//
//  Practice_Color-Theme.swift
//  Moonshot
//
//  Created by David Stanton on 2/20/24.
//

import SwiftUI
// extension of ShapeStyle where Self is Color
// static variables for darkBackground and lightBackground
extension ShapeStyle where Self == Color {
    static var darkBackground2: Color {
        Color(.gray)
    }
    
    static var lightBackground2: Color {
        Color(.gray.opacity(0.5))
    }
}
