//
//  String-isReallyEmpty.swift
//  CupcakeCorner_2
//
//  Created by David Stanton on 3/13/24.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
