//
//  Extention_BinaryInteger.swift
//  ConventionContacts
//
//  Created by David Stanton on 4/17/24.
//
// Operator Overloading
// extension of Binary Integer that takes in two values and multiplies them regardless of type
import Foundation

extension BinaryInteger {
    static func *(lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
    
    static func *(lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}
