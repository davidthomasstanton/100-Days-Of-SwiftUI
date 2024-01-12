import UIKit

/*
let score = 85

if score > 80 {
    print("Great job")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote.")
}

// ====================

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: numbers.count - 1)
}

print(numbers)

let country = "Canada"
if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome \(name)!")
}

var username = "TaylorSwift13"

if username.isEmpty {
    username = "Anonymous"
}

print("Welcome \(username)!")
*/

// Compare multiple conditions ======================

var age = 18

if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent {
    print("You can buy the game")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.escooter

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path.")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now.")
}


// Switch =================================================

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.wind

switch forecast {
    case .sun: print("It should be a nice day")
    case .rain: print("Pack an umbrella")
    case .wind: print("Wear something warm.")
    case.snow: print("School is cancelled.")
    default: print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place {
    case "Gotham": print("You're Batman!")
    case "Mega-City One": print("You're Judge Dredd!")
    case "Wakanda": print("You're Black Panther!")
    default: print("Who are you??")
}

let day = 5
print("On the \(day)th of Christmas, my true love gave to me...")

switch day {
case 5:
    print("Five, golden rings!")
    fallthrough
case 4: 
    print("Four calling birds...")
    fallthrough
case 3: 
    print("Three French Hens...")
    fallthrough
case 2: 
    print("Two turtle doves...")
    fallthrough
case 1: 
    print("And a partridge in a pear tree!")
default: print("That day is not in the song.")
}


// Ternary ===================================

let canVote = age >= 18 ? "Yes" : "No"

print(canVote)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]

print(names.isEmpty ? "Empty array" : "The array has values")

let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

