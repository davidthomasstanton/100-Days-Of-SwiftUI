import Cocoa

/*
// Errors, and Do, Try, Catch
// Function that takes in a password and throws errors if the password is too short or too long
enum PasswordErrors: Error {
    case tooShort, tooLong
}

func checkPassword(of pass: String) throws -> Bool {
    if pass.count < 5 { throw PasswordErrors.tooShort }
    if pass.count > 10 { throw PasswordErrors.tooLong }
    print("\(pass) is adequate.")
    return true
}

var password = "12345334543"

do {
    let passwordChecked = try checkPassword(of: password)
} catch PasswordErrors.tooShort {
    print("Password must be 5 characters.")
} catch PasswordErrors.tooLong {
    print("Password cannot be over 10 characters")
}


// Closure
// Greet a user, copy the function
func greetUser(_ name: String) {
    print("Hello \(name)!")
}

let greetCopy: (String) -> Void = greetUser

greetCopy("Hudson")



// Take an array of names and print them uppercased and only names that begin with "T"
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let formatTeam = team.map { $0.uppercased() }.filter { $0.hasPrefix("T") }.sorted(by: < )
formatTeam.forEach { print("\($0), get over here!") }


// Computed Property ===============================================
// Employee Struct that sets a name, vactionAlloted, vacationTaken
// with a computed property for vacation Remaining
// You can get it with (vacationAllotted - vacationTaken)
// You can set it with vactionAlloted = vacationTaken + newValue
struct Employee {
    let name: String
    var vacationAlloted: Int = 14
    var vacationTaken: Int = 0
    var vacationRemaining: Int {
        get {
            vacationAlloted - vacationTaken
        } set {
            vacationAlloted = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer")
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationRemaining += 4
print(archer.vacationRemaining)
*/

// Character, var: name, actor, probablyGoingToDie (bool), if "Sean Bean" probablyGoing to die

/*
// BankAccount struct with functions to deposit and withdraw
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money.")
}


// Struct FacebookUser with variables for private and public posts
struct FacebookUser {
    private var privatePosts: [String]
    public var publicPosts: [String]
    
    init(privatePosts: [String], publicPosts: [String]) {
        self.privatePosts = privatePosts
        self.publicPosts = publicPosts
    }
    mutating func addPrivatePost(post: String) {
        privatePosts.append(post)
    }
}
var user = FacebookUser(privatePosts: [""], publicPosts: [""])

// struct Order with private variable for id that is initialized
struct Order {
    private var id: Int
    init(id: Int) {
        self.id = id
    }
}
let order = Order(id: 1)

// struct Person, private SSS initialized
struct Person {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person(ssn: "555-55-5555")

// struct Contributer
struct Contributer {
    private var name = "Anonymous"
}
let paul = Contributer()

// struct SecretAgent, private var for actualName, public var for codeName
struct SecretAgent {
    private var actualName: String
    public var codeName: String
    init(name: String, codeName: String) {
        self.actualName = name
        self.codeName = codeName
    }
}
let bond = SecretAgent(name: "James Bond", codeName: "007")

// struct Doctor, var for name, location, private var for currentPatient set to "No one"
struct Doctor {
    var name: String
    var location: String
    private var currentPatient: String
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
        self.currentPatient = "No One"
    }
}
let drJones = Doctor(name: "Esther Jones,", location: "Bristol")

// struct Office, private var for passCode, var for address, employees
struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])

// struct RebelBase, private var for location, peopleCount
struct RebelBase {
    private var location: String
    private var peopleCount: Int
    init(location: String, people: Int) {
        self.location = location
        self.peopleCount = people
    }
}
let base = RebelBase(location: "Yavin", people: 1000)

// struct School, var for staffNames, private var for studentNames
struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: [String]) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: ["Mrs Hughes"])

// struct Customer, var for name, private var for cc#
struct Customer {
    var name: String
    private var creditCardNumber: Int
    init(name: String, creditCard: Int) {
        self.name = name
        self.creditCardNumber = creditCard
    }
}
let lottie = Customer(name: "Lottie Knights", creditCard: 1234567890)

// struct Toy, var customerPrice, private var actualPrice
struct Toy {
    var customerPrice: Double
    private var actualPrice: Double
    init(price: Double) {
        actualPrice = price
        customerPrice = actualPrice * 2
    }
}
let buzz = Toy(price: 10)

// struct App, var for name, private var for sales = 0, init for name
struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")
*/
// Static properties and methods =============================
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighti", password: "h4airf0rce0ne")
}

print(Employee.example)

// struct Amplifier, static constant maxVolume, var current volume
struct Amplifier {
    static let maximumVolume = 11
    var currentVolume: Int
}

struct Question {
    static let answer = 42
    var questionText = "Unknown"
    init(questionText: String) {
        self.questionText = questionText
    }
}

struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}

struct Marathon {
    static let distance = 42
    var name: String
    var location: String
}

struct PlayingCards {
    static let deckSize: Int = 52
    var pictureStyle: String
}

struct Cat {
    static var allCats = [Cat]()
    init() {
        Cat.allCats.append(self)
    }
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}

struct Person {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        Person.population += 1
    }
}

struct FootballTeam {
    static let teamSize = 11
    var players: [String]
}

struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}

struct Order {
    static let orderFormat = "XXX-XXXX"
    var orderNumber: String
}

struct Raffle {
    static var ticketsUsed = 0
    var name: String
    var tickets: Int
    init(name: String, tickets: Int) {
        self.name = name
        self.tickets = tickets
        Raffle.ticketsUsed += tickets
    }
}

struct LegoBrick {
    static var numberMade = 0
    var shape: String
    var color: String
    init(shape: String, color: String) {
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}

// Checkpoint 6
// Make struct to store information about a car
// Model, number of seats, current gear
// add a method to change gears up or down
// what data should be variable or constant? what's the access control?
// Don't allow invalid gears (1...10) seems a fair range

struct Car {
    let model: String
    let seats: Int
    let maxGears: Int
    private(set) var currentGear: Int = 1 {
        didSet {
            print("Current Gear is \(currentGear).")
        }
    }
    
    init(model: String, seats: Int, maxGears: Int) {
        self.model = model
        self.seats = seats
        self.maxGears = maxGears
    }
    
    mutating func changeGear(to gear: Int) {
        if gear < 1 || gear > maxGears {
            print("\(gear) not in range.")
        } else {
            currentGear = gear
        }
    }
    
    mutating func shiftGear(direction: String) {
        if direction == "up" {
            if currentGear == maxGears {
                print("Cannot shift gear higher than \(maxGears).")
            } else {
                currentGear += 1
            }
        } else if direction == "down" {
            if currentGear == 1 {
                print("Cannot shift gear lower than 1.")
            } else {
                currentGear -= 1
            }
        } else {
            print("Please enter \"up\" or \"down\".")
        }
    }
    
    func getGear() -> Int {
        return currentGear
    }
}

var mazda3 = Car(model: "Mazda 3", seats: 5, maxGears: 5)
print("Car is a \(mazda3.model) and has \(mazda3.seats) seats")
mazda3.changeGear(to: 6)
mazda3.shiftGear(direction: "up")
mazda3.shiftGear(direction: "up")
mazda3.shiftGear(direction: "up")
mazda3.shiftGear(direction: "up")
mazda3.shiftGear(direction: "up")
mazda3.shiftGear(direction: "up")
