import UIKit
import SwiftUI

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

var gameOver = false
gameOver.toggle()
print("game over = ", gameOver)

let firstPart = "Hello, "
let secondPart = "World!"
let greeting = firstPart + secondPart
print(greeting)

let people = "Haters"
let action = "hate"
let lyrics = people + " gonna " + action
print(lyrics)

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

print("5 * 5 = \(5*5)")

let celsius = 0
let fahrenheit = (celsius * 9 / 5) + 32
print("Celsius = \(celsius)° = \(fahrenheit)° in Fahrenheit")
