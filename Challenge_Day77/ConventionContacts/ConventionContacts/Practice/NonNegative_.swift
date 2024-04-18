//
//  NonNegative_.swift
//  ConventionContacts
//
//  Created by David Stanton on 4/17/24.
//
// Custom Property Wrapper "NonNegative"
// struct that takes a generic BinaryInteger Value
// create a variable for value, initialize it so if it's less than 0, it's 0
// create a variable for wrappedValue with a getter and setter

import Foundation

@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            value = 0
        } else {
            value = wrappedValue
        }
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
}



