import Cocoa

// Dictionary ==============================================
/*
let planets = [1: "Mercury", 2: "Venus"]
let venus = planets[2, default: "Planet X"]

let ratings = [1: "Bad", 2: "OK", 3: "Good"]
let rating = ratings[2]

let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]

let olympics = [2012: "London", 2016: "Rio", 2020: "Tokyo"]
let london = olympics[2012]

let users = ["Taylor": "Taylor Swift"]
let taylor = users["Taylor", default: "Anonymous"]

let books = ["Austen": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]

print(dickens)

let prices = ["Milk": 1, "Pepsi": 2]
let first = prices["Milk"]

let albums = ["Prince": "Purple Rain"]
let beatles = albums["Beatles"]

let abbreviations = ["m": "meters", "km": "kilometers"]
let meters = abbreviations["m", default: "m"]

let characters = ["Captain": "Malcolm", "Engineer": "Kaylee"]
let captain = characters["Captain"]
*/

// Switch ==================================================
/*
enum Weather {
    case sun, rain, wind, snow
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("Looks like it'll be a lovely day")
case .rain:
    print("Bring an umbrella")
case .wind:
    print("Do you have a jacket?")
default:
    print("Staying in, huh?")
}

let media = "Game"

switch media {
case "TV":
    print("I hear The Office is good")
case "Movie":
    print("21 Dresses!")
case "Game":
    print("Battlegrouns...again??")
default:
    print("GO READ A BOOK")
}

let day = 5

print("On the fifth day of Christmas, my true love gave to me:")
switch day {
case 5:
    print("Five, golden rings!")
    fallthrough
case 4:
    print("Four calling birds")
    fallthrough
case 3:
    print("Three French hens")
    fallthrough
case 2:
    print("Two turtle doves")
    fallthrough
case 1:
    print("And a partridge in a pear tree!")
default:
    print("What day did you say, agina?")
}
*/

/*
// Checkpoint 4 ======================================================
// Function that accepts an integer from 1 - 10,000 and returns the square root of that number
// throw out of bounds errors
// only consider integer square roots
enum squareErrors: Error {
    case outOfBounds, noSquare
}

let numberToCheck = -980223

func findSquare(of num: Int) throws -> Int {
    if num < 1 || num > 10_000 { throw squareErrors.outOfBounds }
    
    for i in 1...100 {
        if num == i * i {
            return i
        }
    }
    throw squareErrors.noSquare
}

do {
    let numberSquare = try findSquare(of: numberToCheck)
    print("The square of \(numberToCheck) is \(numberSquare).")
} catch squareErrors.outOfBounds {
    print("\(numberToCheck) is not in range of 1 to 10,000.")
} catch squareErrors.noSquare {
    print("\(numberToCheck) does not have an integer square root.")
}
*/

// Closures ================================================================
/*
var painPicture = {
    print("Where are my watercolors?")
}

var learnSwift = {
    print("Closures are like functions")
}
//learnSwift()

var closureStatement = {
    print("This is a closure")
}
//closureStatement()

let greetUser = {
    print("Hi there!")
}
//greetUser()

var connectVPN = {
    print("Connected!")
}
//connectVPN()

var promptOne = {
    print("Where did the heavenely marshmallows come from??")
}

var marshmallows = {
    print("The elves in the bakery made them.")
}

var promptTwo = {
    print("Yes, but where can I get them?")
}

var marshmallowsLocal = {
    print("The French shop in the Farmer's Market might have them? Check there.")
}

//promptOne()
//marshmallows()
//promptTwo()
//marshmallowsLocal()

var cleanRoom = { (roomName: String) in
    print("I'm cleaning the \(roomName).")
}

// cleanRoom("Bedroom")

var tweet = { (_ message: String) in
    if message != "" {
        print("I'm tweeting: \(message)")
    } else {
        print("Message empty")
    }
}

// tweet("Hello, world!")

var button = { (button: Int) in
    if button >= 0 {
        print("Button \(button) was clicked.")
    } else {
        print("Button doesn't exist.")
    }
}

// button(1)

var printDocument = { (copies: Int) in
    for _ in 1...copies {
        print("Printing document...")
    }
}

// printDocument(1020)

var shareWinnings = { (winnings: Double) in
    let half = winnings / 2.0
    print("It's \(half) for me and \(half) for you!")
}
// shareWinnings(50)

var pickFruit = { (fruit: String) in
    switch fruit {
    case "strawberry":
        fallthrough
    case "rasberry":
        print("strawberries and rasberries are half price!")
    default:
        print("We don't have those.")
    }
}
//pickFruit("strawberry")

var meaningOfAllThings = { (answer: Int) in
    if answer == 42 {
        print("Then you know...")
    } else {
        print("Continue to ask the question.")
    }
}

// meaningOfAllThings(42)

let fixCar = { (problem: String) in
        print("I fixed the \(problem).")
}

//fixCar("Blown out tire")

let makeReservation = { (people: Int) in
        print("I'd like a table for \(people), please.")
}

// makeReservation(23)

var cutGrass = { (currentLength: Double) in
    switch currentLength {
    case 0...1:
        print("That's too short")
    case 1...3:
        print("It's already the right length")
    default:
        print("That's perfect.")
    }
}

let watchTV = { (channel: String) in
print("I'm going to watch some \(channel)")
}
// watchTV("BBC News")

let rowBoat = { (distance: Int) in
    for _ in 1...distance {
        print("I'm rowing 1km.")
    }
}

// rowBoat(3)

var flyDrone = { (hasPermit: Bool) -> Bool in
    if hasPermit {
        print("Let's find somewhere safe!")
        return true
    }
    print("That's against the law.")
    return false
}
// let willFly = flyDrone(true)

let shovelSnow = { (depth: Int) -> String in
    if depth < 1 {
        return "Ok, I can do this..."
    } else {
        return "I need some help!"
    }
}

// print(shovelSnow(-1))
let measureSize = { (inches: Int) -> String in
    switch inches {
    case 0...26:
        return "XS"
    case 27...30:
        return "S"
    default:
        return "XL"
    }
}

// print(measureSize(36))

var callNumber = { (number: Int) -> String in
    return "Calling now..."
}

var swift = {
    print("Cool -- I can use closures!")
}

func writeCode(using language: () -> Void) {
    language()
    print("That'll be elventy billion dollars, please.")
}

var playWithDog = {
    print("Fetch!")
}

func playWithAnimal(using playType: () -> Void) -> Void {
    print("Let's play a game")
    playType()
}

//playWithAnimal(using: playWithDog)

var makeFromStraw = {
    print("Let's build it out of straw")
}
func buildHouse(using buildingStyle: () -> Void) {
    buildingStyle()
    print("It's ready -- can anyone blow it down?")
}
//buildHouse(using: makeFromStraw)

let awesomeTalk = {
    print("And welcome to my TED Talk.")
}
func deliverTalk(name: String, type: () -> Void) {
    print("Hello, my name is \(name).")
    type()
}
// deliverTalk(name: "David", type: awesomeTalk)

let swanDive = {
    print("Swan dive!")
}

let cannonball = {
    print("CANNON BALL!")
}

func performDive(type dive: () -> Void) {
    print("I'm climbing up to the top")
    dive()
}

// performDive(type: swanDive)
// performDive(type: cannonball)

let helicopter = {
    print("Let's get to the chopper.")
}

let propPlane = {
    print("Anyone know how to fly this?")
}

func travel(by travelMeans: () -> Void) {
    print("Time to take a trip:")
    travelMeans()
}
// travel(by: helicopter)

func phoneFriend(conversation: () -> Void) {
    print("Calling 555-1234...")
    conversation()
}

func doTricks(_ tricks: () -> Void) {
    print("Start recording now!")
    tricks()
    print("Did you get all that?")
}

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}

func makeCake(instructions: () -> Void) {
    print("Step 1")
    print("Step 2")
    instructions()
    print("Here's your cake.")
}

func brewTea(steps: () -> Void) {
    print("Get tea")
    print("Get milk")
    steps()
}
*/




// Checkpoint 6
// Make struct to store information about a car
// Model, number of seats, current gear
// add a method to change gears up or down
// what data should be variable or constant? what's the access control?
// Don't allow invalid gears (1...10) seems a fair range



// Class ============================================================
/*
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10



class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) a day, but other times will spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm goint to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
        
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)
*/

// Class Inheritance =========================================
/*
class Vehicle {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}

class Truck: Vehicle {
    var goodsCapacity: Int
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacity = goodsCapacity
        super.init(wheels: wheels)
    }
}

class Student {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class UniversityStudent: Student {
    var annualFees: Int
    init(name: String, annualFees: Int) {
        self.annualFees = annualFees
        super.init(name: name)
    }
}

class Handbag {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}

class DesignerHandbag: Handbag {
    var brand: String
    init(brand: String, price: Int) {
        self.brand = brand
        super.init(price: price)
    }
}

class Product {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Book: Product {
    var isbn: String
    init(name: String, isbn: String) {
        self.isbn = isbn
        super.init(name: name)
    }
}

class Computer {
    var cpu: String
    var ramGB: Int
    init(cpu: String, ramGB: Int) {
        self.cpu = cpu
        self.ramGB = ramGB
    }
}

class Laptop: Computer {
    var screenInches: Int
    init(screenInches: Int, cpu: String, ramGB: Int) {
        self.screenInches = screenInches
        super.init(cpu: cpu, ramGB: ramGB)
    }
}

class Bicycle {
    var color: String
    init(color: String) {
        self.color = color
    }
}

class MountainBike: Bicycle {
    var tireThickness: Double
    init(color: String, tireThickness: Double) {
        self.tireThickness = tireThickness
        super.init(color: color)
    }
}

class SmartPhone {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}

class Android: SmartPhone {
    var features: [String]
    init(features: [String], price: Int) {
        self.features = features
        super.init(price: features.count * 50)
    }
}

class Dog {
    var breed: String
    var isPedigree: Bool
    init(breed: String, isPedigree: Bool) {
        self.breed = breed
        self.isPedigree = isPedigree
    }
}

class Poodle: Dog {
    var name: String
    init(name: String) {
        self.name = name
        super.init(breed: "Poodle", isPedigree: true)
    }
}

class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}

class Printer {
    var cost: Int
    init(cost: Int) {
        self.cost = cost
    }
}
class LaserPrinter: Printer {
    var model: String
    init(model: String, cost: Int) {
        self.model = model
        super.init(cost: cost)
    }
}

class Food {
    var name: String
    var nutritionRating: Int
    init(name: String, nutritionRating: Int) {
        self.name = name
        self.nutritionRating = nutritionRating
    }
}
class Pizza: Food {
    init() {
        super.init(name: "Pizza", nutritionRating: 3)
    }
}

class Shape {
    var sides: Int
    init(sides: Int) {
        self.sides = sides
    }
}
class Rectangle: Shape {
    var color: String
    init(color: String) {
        self.color = color
        super.init(sides: 4)
    }
}
*/

// How to Copy Classes ===============================
/*
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"
print(user1.username)
print(user2.username)

class Statue {
    var sculptor = "Unknown"
}

struct GalacticaCrew {
    var isCylon = false
}
var starbuck = GalacticaCrew()
var tyrol = starbuck
tyrol.isCylon = true
print(starbuck.isCylon)
print(tyrol.isCylon)


var venusDeMilo = Statue()
venusDeMilo.sculptor = "Aelexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)

struct Calculator {
    var currentTotal = 0
}

class Starship {
    var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)

var baseModel = Calculator()
var casio = baseModel
var texas = baseModel
casio.currentTotal = 556
texas.currentTotal = 384
print(casio.currentTotal)
print(texas.currentTotal)

class Magazine {
    var pageCount = 132
}
var example = Magazine()
var wired = example
wired.pageCount = 164
var vogue = example
vogue.pageCount = 128
print("Example page count: \(example.pageCount)")
print("Wired page count: \(wired.pageCount)")
print("Vogue page count: \(vogue.pageCount)")

class Hairdresser {
    var clients = [String]()
}
var tim = Hairdresser()
tim.clients.append("Jess")
var dave = tim
dave.clients.append("Sam")
print(tim.clients.count)
print(dave.clients.count)

class UserId {
    let id: Int
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

/*
for i in 1...3 {
    let user = UserId(id: i)
    print("User \(user.id): I'm in control!")

}
*/

var users = [UserId]()

for i in 1...3 {
    let user = UserId(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

class UserExample {
    var name = "Paul"
}

var user = UserExample()
user.name = "Taylor"
user = UserExample()
print(user.name)
*/

// Mutability =================================================
/*
class Pizza {
    private var toppings = [String]()
    func add(topping: String) {
        toppings.append(topping)
    }
}
var pizza = Pizza()
pizza.add(topping: "Mushrooms")

class School {
    var students = 200
    func expel(student: String, for reason: String) {
        print("\(student) has been expelled for \(reason).")
        students -= 1
    }
}

struct Park {
    var numberOfFlowers = 1000
    mutating func plantFlowers() {
        numberOfFlowers += 50
    }
}
var park = Park()
park.plantFlowers()

struct Piano {
    var untunedKeys = 4
    mutating func tune() {
        if untunedKeys > 0 {
            untunedKeys -= 1
        }
    }
}
var piano = Piano()
piano.tune()
*/

// Checkpoint 7
// Class heirarchy for animals, Animal => Dog, Cat, => Corgi, Poodle; Persian, Lion
// legs property for number of legs in Animal
// Dog & Cat has speak() method, each subclass prints something different
// Cat has isTame Boolean with an initializer
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    var bark: String
    
    init(bark: String, legs: Int) {
        self.bark = bark
        super.init(legs: legs)
    }
    
    func speak() {
        print(bark)
    }
}

class Corgi: Dog {
    
    override func speak() {
        print("Yip!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Bark!")
    }
}

class Cat: Animal {
    var meow: String
    var isTame: Bool
    
    init(legs: Int, meow: String, isTame: Bool) {
        self.meow = meow
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print(meow)
    }
    
}

class Persian: Cat {
    
    override func speak() {
        print("Meooooow")
    }

}

class Lion: Cat {
    
    override func speak() {
        print("RRROOOOOOOOAAAAAAR")
    }
}
