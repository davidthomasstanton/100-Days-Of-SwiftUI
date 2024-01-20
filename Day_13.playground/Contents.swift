import Cocoa

// Protocol =============================
/*
protocol Vehicle {
    var name: String { get set }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    var name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day")
    }
}

struct Bicycle: Vehicle {
    var name = "Bicycle"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}


let bike = Bicycle()
//commute(distance: 50, using: bike)

let car = Car(name: "Mazda 3", currentPassengers: 2)
//commute(distance: 100, using: car)

getTravelEstimates(using: [car, bike], distance: 50)


protocol Purchaseable {
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Cars2: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

protocol Swimmable {
    var depth: Double { get }
}

protocol Knittable {
    var needleSizes: [Double] { get set }
}

protocol Singable {
    var lyrics: [String] { get set }
    var notes: [String] { get set }
}

protocol Buildable {
    var numberOfBricks: Int { get set }
    var materials: [String] { get set }
}
*/

// Opaque return types =====================================
/*
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomBool() == getRandomBool())
*/

// Extensions ================================
/*
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}


var quote = "   The truth is rarely pure and never simple   "

//let trimmedQuote = quote.trimmed()
//print(trimmedQuote)

let lyric = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyric.lines.count)


struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }

}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

extension String {
    mutating func append(_ other: String) {
        self += other
    }
}

extension Int {
    func times(_ action: () -> Void) {
        for _ in 0..<self {
            action()
        }
    }
}

extension Array {
    func summarize() {
        print("The array has \(count) items. They are:")
        for item in self {
            print(item)
        }
    }
}

extension Bool {
    func toggled() -> Bool {
        if self == true {
            return false
        } else {
            return true
        }
    }
}

extension Int {
    func cubed() -> Int {
        return self * self * self
    }
}

extension Int {
    func clamped(min: Int, max: Int) -> Int {
        if (self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}

extension String {
    var isLong: Bool {
        return count > 25
    }
}

extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}

extension String {
    func isUppercased() -> Bool {
        return self == self.uppercased()
    }
}
*/

// Protocol Extensions =======================================

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    //print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello () {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
//taylor.sayHello()

protocol DogTrainer {
    var dog: String { get set }
    func train(dog: String)
}

extension DogTrainer {
    func train(dog: String) {
        print("We'll make \(dog) behave in no time!")
    }
}

protocol Chef {
    func GetRecipes() -> [String]
}

extension Chef {
    func GetRecipes() -> [String] {
        return ["Macaroni Cheese"]
    }
}

protocol SmartPhone {
    func makeCall(to name: String)
}

extension SmartPhone {
    func makeCall(to name: String) {
        print("Dialling \(name)...")
    }
}

protocol Politician {
    var isDirty: Bool {get set}
    func takeBribe()
}

extension Politician {
    func takeBribe() {
        if isDirty {
            print("Thank you very much!")
        } else {
            print("Someone call the police!")
        }
    }
}

protocol Anime {
    var availableLanguages: [String] { get set }
    func watch(in language: String)
}

extension Anime {
    func watch(in language: String) {
        if availableLanguages.contains(language) {
            print("Now playing in \(language)")
        } else {
            print("Unrecognized language.")
        }
    }
}

protocol Club {
    func organizeMeeting(day: String)
}

extension Club {
    func organizeMeeting(day: String) {
        print("We're going to meet on \(day).")
    }
}

protocol SuperHeroMovie {
    func writeScript() -> String
}

extension SuperHeroMovie {
    func makeScript() -> String {
        return """
        Lots of special effects,
        some half-baked jokes,
        and a hint of another
        sequel at the end.
        """
    }
}

protocol Mammal {
    func eat()
}
extension Mammal {
    func eat() {
        print("Time for dinner!")
    }
}

protocol Hamster {
    var name: String { get set }
    func runInWheel(minutes: Int)
}

extension Hamster {
    func runInWheel(minutes: Int) {
        print("\(name) is going for a run.")
        for _ in 0..<minutes {
            print("Whirr whirr whirr")
        }
    }
}

struct MrSqueaks: Hamster {
    var name = "Mr. Squeaks"
    
}

var pet = MrSqueaks()
//pet.runInWheel(minutes: 30)

protocol Starship {
    func transport(number: Int)
}
extension Starship {
    func transport(number: Int) {
        print("\(number) to beam up - energize!")
    }
}

protocol Fencer {
    func fenceFoil()
}
extension Fencer {
    func fenceFoil() {
        print("En garde!")
    }
}


// Checkpoint 8 ============================
// Make a protocol that describes a building
// Rooms: Int, Cost: Int, realEstateAgent: String
// method for printing the sales summary
// create two structs House and Office that conform to Building

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var realEstateAgent: String { get set }
    
}

extension Building {
    func salesSummary() {
        print("This property was listed and sold by \(realEstateAgent).")
        print("It has \(rooms) rooms and it cost $\(cost). Quite the bargain in this economy!")
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var realEstateAgent: String
   
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var realEstateAgent: String
    func salesSummary() {
        print("This property was listed and sold by \(realEstateAgent).")
        print("It has \(rooms) rooms and it costs $\(cost) per month.")
    }
}

let myHouse = House(rooms: 3, cost: 750_000, realEstateAgent: "Grifter McGee")
myHouse.salesSummary()

let myOffice = Office(rooms: 12, cost: 12_000, realEstateAgent: "Mr. No Discenerable Skills")
myOffice.salesSummary()
