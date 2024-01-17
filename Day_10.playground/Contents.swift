import Cocoa

/*
 

// Errors, and Do, Try, Catch
// Function that takes in a password and throws errors if the password is too short or too long
enum PasswordErrors: Error {
    case tooShort, tooLong
}

func checkPassword(_ pass: String) throws -> Bool {
    if pass.count < 5 { throw PasswordErrors.tooShort }
    if pass.count > 10 { throw PasswordErrors.tooLong }
    print("Password: \(pass), is sufficient.")
    return true
}

let passwordToCheck = "123876"
do {
    let passChecked = try checkPassword(passwordToCheck)
} catch PasswordErrors.tooShort {
    print("Password must be longer than 5 digits.")
} catch PasswordErrors.tooLong {
    print("Password must be shorter than 10 digits.")
}

// Function that takes in a number between 1 and 10,000 and calculates times tables
enum TimesTableErrors: Error {
    case tooShort, tooLong
}

func timesTable(of num: Int, size: Int) throws -> [Int] {
    if num < 1 { throw TimesTableErrors.tooShort }
    if num > 10_000 { throw TimesTableErrors.tooLong }
    
    var timesTable = [Int]()
    for i in 1...size {
        timesTable.append(i * num)
    }
    return timesTable
}

let baseNum = 11

do {
    let table = try timesTable(of: baseNum, size: 12)
    for i in 0..<table.count {
        print("\(baseNum) * \(i+1) is \(table[i])")
    }
} catch TimesTableErrors.tooShort {
    print("Base number must be more than 0.")
} catch TimesTableErrors.tooLong {
    print("Base number must be less than 10,000.")
}



// Closure
// Greet a user, copy the function
func greetUser(userName: String) {
    print("Hello \(userName)!")
}

let greetCopy: (String) -> Void = greetUser

greetCopy("Paul")

// Take an array of names and print them uppercased and only names that begin with "T"
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

team.map { $0.uppercased() }.sorted { $0 < $1 }.map { "\($0)! Get over here, now!" }.forEach { print($0) }

// Creates a Roll function that spits out a random numer 1-20 that is passed into a generate Roll Function

// Function that takes an array of numbers and sorts them, filters out even numbers, prints each as a "lucky number"

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


*/


// Structs =========================================================

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

/*
struct Employee {
    let name: String
    var vacationRemaining: Int = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining \(vacationRemaining)")
        } else {
            print("Ooops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)


let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

struct RubiksCube {
    var size = 3
}
let large = RubiksCube(5)
*/

// Computed Property ===============================================
// Employee Struct that sets a name, vactionAlloted, vacationTaken
// with a computed property for vacation Remaining 
// You can get it with (vacationAllotted - vacationTaken)
// You can set it with vactionAlloted = vacationTaken + newValue
struct Employee {
    let name: String
    var vacationAlloted = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAlloted - vacationTaken
        } set {
            vacationAlloted = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Archer Sterling", vacationAlloted: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAlloted)


/*
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)
*/

// Property Observers ========================================
// didSet, willSet
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1



struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrien E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct House {
    var numberOfOccupants: Int {
        didSet {
            print("\(numberOfOccupants) people live here now.")
        }
    }
}

// Custom Initializers ===========================================
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)


struct Dictionary {
    var words = Set<String>()
}

let dictionary = Dictionary()

struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}

struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}
let message = Message()

struct PowerTool {
    var name: String
    var cost: Int
}
let drill = PowerTool(name: "Hammer Drill", cost: 80)

struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init (itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)

struct District {
    var number: Int
    var supervisor: String
    init(number: Int, supervisor: String) {
        self.number = number
        self.supervisor = supervisor
    }
}
let district = District(number: 9, supervisor: "Unknown")


// Structs
// Conference, name, location
struct Conference {
    var name: String
    var location: String
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
let wwdc = Conference(name: "WWDC", location: "San Jose")

// Superhero, nickname, powers
struct Superhero {
    var nickname: String
    var powers: [String]
    
    init(nickname: String, powers: [String]) {
        self.nickname = nickname
        self.powers = powers
    }
}
let batman = Superhero(nickname: "The Caped Crusader", powers: ["Being super rich"])

// Kitchen, utensils
struct Kitchen {
    var utensils: [String]
    init(utensils: [String]) {
        self.utensils = utensils
    }
}

// Parent: var numberOfKids, tirednessPercent
struct Parent {
    var numberOfKids: Int
    var tirednessPercent: Int
    init(kids: Int, tiredness: Int) {
        self.numberOfKids = kids
        self.tirednessPercent = tiredness
    }
}
let xiao = Parent(kids: 2, tiredness: 4)

// Language, var: name, locale, speakerCount
struct Language {
    var name: String
    var locale: String
    var speakerCount: Int
    init(languageName: String, locale: String, numOfSpeakers: Int) {
        self.name = languageName
        self.locale = locale
        self.speakerCount = numOfSpeakers
    }
}
let french = Language(languageName: "French", locale: "Francois", numOfSpeakers: 234_000_023)

// Bus, var: routeNumber
struct Bus {
    var routeNumber: Int
    init(route: Int) {
        self.routeNumber = route
    }
}

// Cat, var: name, breed, meowVolume
struct Cat {
    var name: String
    var breed: String
    var meowVolume: Int = 10
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
let kip = Cat(name: "Kip", breed: "Just an Orange Tabby")
print(kip.meowVolume)

// Character, var: name, actor, probablyGoingToDie (bool), if "Sean Bean" probablyGoing to die
struct Character {
    var name: String
    var actor: String
    var probablyGoingToDie: Bool
    init(name: String, actor: String) {
        self.name = name
        self.actor = actor
        if actor == "Sean Bean" {
            probablyGoingToDie = true
        } else {
            probablyGoingToDie = false
        }
    }
}

let sean = Character(name: "Ned S", actor: "Sean Bean")
let keanu = Character(name: "John W", actor: "Keanu Reeves")

print("\(keanu.name) is played by \(keanu.actor) and he will die? is...\(keanu.probablyGoingToDie)!")
print("\(sean.name) is played by \(sean.actor) and he will die? is...\(sean.probablyGoingToDie)!")

// Cottage, var: rooms, rating
struct Cottage {
    var rooms: Int
    var rating: Int = 5
    init(rooms: Int) {
        self.rooms = rooms
    }
}
let bailbrookHouse = Cottage(rooms: 4)

// Struct, Framework, var: name, language
struct Framework {
    var name: String
    var language: String
    init(name: String, language: String) {
        self.name = name
        self.language = language
    }
}
let vapor = Framework(name: "Vapor", language: "Swift")

// Computer, cpus, ramGb
struct Computer {
    var cpus: Int
    var ramGB: Int
    init(cpu: Int, ram: Int) {
        self.cpus = cpu
        self.ramGB = ram
    }
}

// District, var number, supervisor
struct District2 {
    var number: Int
    var supervisor: String
    init(number: Int, supervisor: String) {
        self.number = number
        self.supervisor = supervisor
    }
}
let district2 = District2(number: 9, supervisor: "Unknown")
