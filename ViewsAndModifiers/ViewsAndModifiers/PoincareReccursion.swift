//
//  PoincareReccursion.swift
//  ViewsAndModifiers
//
//  Created by David Stanton on 1/27/24.
//

import SwiftUI

struct PoincareReccursion: View {
    @State private var number: Int = 1
    @State private var powerOf: Int = 1
    
    var body: some View {
        VStack {
            Form {
                Section ("Enter a number") {
                    TextField("Enter a number: ", value: $number, format: .number)

                }
                Section ("To the power of") {
                    TextField("To the power of: ", value: $powerOf, format: .number)
                }
                Text("\(number) to the power of \(powerOf) is: \(numberPower(num: number, power: powerOf))")
            }
        }
    }
    
    func numberPower(num: Int, power: Int) -> Int {
        var temp: Int = num
        for _ in 1..<power {
            temp *= num
        }
        return temp
    }
}


#Preview {
    PoincareReccursion()
}
