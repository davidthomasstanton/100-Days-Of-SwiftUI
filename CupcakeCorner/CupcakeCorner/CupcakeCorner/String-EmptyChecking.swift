//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by David Stanton on 3/13/24.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
