//
//  LightState.swift
//  Flashlight
//
//  Created by David Stanton on 2/17/24.
//

import SwiftUI

enum LightState {
    case off, on, misdirection, hidden
    
    var color: some ShapeStyle {
        switch self {
        case .off:
            Color.red.gradient
        case .on:
            Color.green.gradient
        case .misdirection, .hidden:
            Color.yellow.gradient
        }
    }
    
    var symbol: String {
        switch self {
        case .off, .misdirection, .hidden:
            "xmark.circle"
        case .on:
            "checkmark.circle.fill"
        }
    }
}
