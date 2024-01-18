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




// Checkpoint 6
// Make struct to store information about a car
// Model, number of seats, current gear
// add a method to change gears up or down
// what data should be variable or constant? what's the access control?
// Don't allow invalid gears (1...10) seems a fair range

