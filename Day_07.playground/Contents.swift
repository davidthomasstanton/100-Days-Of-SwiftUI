import UIKit
import Cocoa


/*
// for loop
for i in 1...100 {
    print("\(i) * \(i) = \(i*i)")
}


var i: Int = 1

// while loop
while i < 101 {
    switch (i % 3 == 0, i % 5 == 0) {
    case (true, true):
        print("FizzBuzz")
    case (true, false):
        print("Fizz")
    case (false, true):
        print("Buzz")
    default:
        print(i)
    }
    i += 1
}
*/
/*
// Functions
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centiemters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) = \(i * number)")
    }
}

printTimesTable(number: 5, end: 1)

func count(to: Int) {
    for i in 1...to {
        print("I'm counting: \(i)")
    }
}

count(to: 1)

func open(gifts: [String]) {
    for gift in gifts {
        print("It's a \(gift) -- thank you!")
    }
}

open(gifts: ["guitar", "pair of socks"])

func makeBand(names: [String]) {
    print("Let's start a band...")
    for name in names {
        print("\(name) wants to join!")
    }
}
makeBand(names: ["John", "Paul"])
*/

// Return Values from functions
let root = sqrt(169)
print(root)

// Dice Rolling
func rollDice(size: Int) -> Int {
    return Int.random(in: 1...size)
}

let result = rollDice(size: 20)
print(result)

// Do two strings contain the same letters, regardless of their order?
func sameString(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

let firstString = "ABC"
let secondString = "BACD"

print("\(firstString) and \(secondString) are...", terminator: "")
if sameString(string1: firstString, string2: secondString) {
    print("identical.")
} else {
    print("not identitcal.")
}

// Pythagorean Theorum
func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()

print("Name: \(user.firstName) \(user.lastName)")

func getUser3() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let (firstName , lastName) = getUser3()
print("Name: \(firstName), \(lastName)")

func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    
    for _ in 1...count{
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    return rolls
}

let lyric = "I see a red door and I want it painted black."
print(lyric.hasPrefix("I see"))

func isUppercased(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercased(string)

func printTimeTable(for number: Int) {
    for i in 1...12 {
        print("\(i) * number = \(i*number)")
    }
}

printTimeTable(for: 5)

func evaluateJavaScript(_ input: String) {
    print("Yup, that's JavaScript alright.")
}
