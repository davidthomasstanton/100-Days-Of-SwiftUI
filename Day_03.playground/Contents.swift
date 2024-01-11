import UIKit

var greeting = "Hello, playground"


// ARRAYS =================================================
var beatles = ["John", "Paul", "George", "Ringo"]

print(beatles[0])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")

var scores = Array<Int>()

scores.append(100)
scores.append(90)
scores.append(85)
print(scores[1])

var albums = ["Folklore"]
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

albums.remove(at: 3)
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())
print(cities.reversed())

var swift = "Swift"
print(swift.sorted())

// DICTIONARIES ===================================================

let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

let hasGraduated = [
    "Erik": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])
print("The 2016 Olympics took place in \(olympics[2016, default: "Unknown"]).")

var heights = [String: Int]()

heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

print(heights["Yao Ming", default: 0])

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "The Penguin"

print(archEnemies["Batman", default: "Unknown"])

let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]

let abbreviations = ["m": "meters", "km": "kilometers"]
let meters = abbreviations["m", default: "m"]

// SET ======================================================
var actors = Set<String>()
actors.insert("Denzel Washington")
actors.insert("Tom Cruise")
actors.insert("Nicolas Cage")
actors.insert("Samuel L Jackson")

print(actors.sorted())

var pets = [String]()

pets.append("Squeeky")
pets.append("Kaz")
pets.append("Sara")
pets.append("Foster")
pets.append("Sheila")
print(pets)

var cars = [
    "Model 3": "Tesla",
    "Model Y": "Tesla",
    "3": "Mazda"
]

print(cars["3", default: "Unknown"])

var produce = (["lettuce", "carrots", "cucumber"])

print(produce)


enum weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

enum weekend {
    case saturday, sunday
}

var day = weekday.monday
day = weekday.tuesday
day = weekday.wednesday
print("Today is \(day).")

var partyDay = weekend.saturday
partyDay = .sunday


