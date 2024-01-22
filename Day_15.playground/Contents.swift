import Cocoa

var name = "Ted"
name = "Rebecca"
let user = "Daphne"

print(user)

let actor = "Tom Cruise 🥸"
let quote = """
A day in
the life of
an apple engineer"
"""

print(quote.count)

print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5
let number = 120
print(number.isMultiple(of: 3))

name = "Taylor"
let age = 26
let message = ("I'm \(name) and I'm \(age) years old.")

var double = 3.0

let colors = ["Red", "Green", "Blue"]
//let numbers = [4, 2, 56, 12]
let readings = [0.1, 0.5, 0.8]

print(colors[0])

print(colors.contains("octarine"))

let employees = [
    "name": "Taylor",
    "job": "Singer"
]
print(employees["name", default: "unknown"])

var numbers = Set([1, 4, 6, 6, 6, 3, 5])
print(numbers.count)

enum weekday {
    case monday, tuesday, wednesday, thursday, friday
}
var today = weekday.monday
print(today)

var albums: [String] = ["Red", "Fearless"]
var user2: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

var user3 = Dictionary<String, String>()
var books2 = Set<String>()

var user4 = [String: String]()
var books3 = Set<String>()


let temp = 26
if temp > 26 && temp < 30 {
    print("It's a nice day")
}

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .rain:
    print("bring an umbrella")
case .wind:
    print("bring a jacket")
default: print("It's going to be a nice day.")
}

var lyric = "haters gonna "

for _ in 1...5 {
    lyric += "hate "
}

print(lyric)

func printTimesTable(number: Int) {
    for i in 1...number {
        print("\(i) x \(number) = \(i*number)")
    }
}

//printTimesTable(number: 45)

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user5 = getUser()
print(user5.firstName, user5.lastName)

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO"
print(isUppercase(string))

func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome \(person)")
    } else {
        print("Hi, \(person)")
    }
}

greet("Taim", formal: true)
greet("Gerald")

enum PasswordErrors: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordErrors.short }
    if password == "12345" { throw PasswordErrors.obvious }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

do {
    let result = try checkPassword("12345")
    print("Rating: \(result)")
} catch PasswordErrors.short {
    print("Password too short")
} catch PasswordErrors.obvious {
    print("Password too obvious")
} catch {
    print("Error")
}

// Closure ==========================
let sayHello = { (name: String) -> String in
    return ("Hello \(name)")
}

let greet3 = sayHello("Paul")
print(greet3)

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})

print(onlyT)

let onlyT2 = team.filter { $0.hasPrefix("T") }
print(onlyT2)

struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    mutating func removeFromSale() {
        isReleased = false
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()

struct Employee {
    let name: String
    var vacationAllowed = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllowed - vacationTaken
        } set {
            vacationAllowed = vacationTaken + newValue
        }
    }
}

struct Game {
    var score = 0 {
        didSet {
            print("score is \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

// private, private(set), fileprivate, public
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withrdaw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

struct AppData {
    static let version = "1.3 Beta 2"
    static let settingsFile = "settings.json"
}

class Employee2 {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee2 {
    func work() {
        print("I'm coding for \(hours) hours a day.")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()

class Vehicle {
    let electric: Bool
    
    init(electric: Bool) {
        self.electric = electric
    }
    
}


class Car: Vehicle {
    let isConvertible: Bool
    
    init(electric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(electric: electric)
    }
}
