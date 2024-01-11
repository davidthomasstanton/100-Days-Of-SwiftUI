import UIKit

let surname: String = "Lasso"
var score: Double  = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
var albums: [String] = ["Red", "Fearless"]

var user: [String: String] = ["id": "@twostraws"]

var books: Set<String> = Set([
    "The Bluest Eye",
    ""
])

var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

style = .dark

let username: String
// do lots of things

username = "@twostraws"
print(username)

var name: String

let classNames = ["Harry", "Megan", "Paul", "Douglas"]
var raceTimes: [String: Double] = ["Harry": 3.23, "Megan": 4.32, "Paul": 3.13, "Douglas": 5.4]


print("Harry's time was \(raceTimes["Harry", default: 0.0])")

var fishTypes = (["makerol", "sardines", "anchovies"])

fishTypes.append("Tuna")

print(fishTypes)

enum weekend { case saturday, sunday }
enum weekday {
    case monday, tuesday, wednesday, thursday, friday
}

// Array
var times = ["3:45", "2:23", "9:23"]

// Dictionary
var grades = ["Bill": 90, "Harry": 86, "Billy": 88]

// Set
var averages: Set = ([1, 1, 1, 2, 3, 4, 4, 4, 5, 5, 5])
print(type(of: averages))

// Enum
enum foodTypes {
    case italian, mexican, american
}

var favoriteFood = foodTypes.american
print(favoriteFood)

// Checkpoint 2

// Create an array of strings
var snacks = ["chips", "carrot sticks", "bell peppers", "funions", "pirate's booty", "chips"]

print("The number of snacks you have is \(snacks.count).")

var snackSet = Set<String>()
var moreSnacks = Set(snacks)

for snack in snacks {
    snackSet.insert(snack)
}

print("The number of unique snacks you have is \(snackSet.count).")
print("The number of unique snacks you have is \(moreSnacks.count).")
