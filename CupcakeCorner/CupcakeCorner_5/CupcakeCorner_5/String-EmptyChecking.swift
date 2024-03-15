//
//  String-EmptyChecking.swift
//  CupcakeCorner_5
//
//  Created by David Stanton on 3/14/24.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
