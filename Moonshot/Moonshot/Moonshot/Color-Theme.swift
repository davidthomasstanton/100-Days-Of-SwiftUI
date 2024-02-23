//
//  Color-Theme.swift
//  Moonshot
//
//  Created by David Stanton on 2/20/24.
//

import SwiftUI
// extension of ShapeStyle where Self is Color
// static variables for darkBackground and lightBackground
// dark: Color(red: 0.1, green: 0.1, blue: 0.2)
// light: Color(red: 0.2, green: 0.2, blue: 0.3)

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
