import Cocoa

// Optionals ==============================================
/*
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num3: Int? = nil
print(type(of: num3))

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
}

func getUsername() -> String? {
    nil
}

if let username = getUsername() {
    print("Username is \(username)")
} else {
    print("No username")
}

var favoriteMovie: String? = nil
favoriteMovie = "The Life of Brian"
if let favoriteMovie {
    print("Your favorite movie is \(favoriteMovie).")
} else {
    print("You don't have a favorite movie.")
}

var weatherForecast: String? = "sunny"
if let forecast = weatherForecast {
    print("The forecast is \(forecast).")
} else {
    print("No forecast available.")
}

let song: String? = "Shake it Off"
if let unwrappedSong = song {
    print("The name has \(unwrappedSong.count) letters.")
}

let currentDestination: String? = nil
if let destination = currentDestination {
    print("We're walking to \(destination).")
} else {
    print("We're just wandering.")
}

let tableHeight: Double? = 100
if let tableHeight {
    if tableHeight > 85.0 {
        print("The table is too high.")
    }
}

let menuItems: [String]? = ["Pizza", "Pasta"]
if let items = menuItems {
    print("There are \(items.count) items to choose from.")
}

var score: Int? = nil
score = 556

if let playerScore = score {
    print("You score \(playerScore) points.")
}

let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
    print("Found \(album) at position \(position).")
}

let userAge: Int? = 38
if let age = userAge {
    print("You are \(age) years old.")
}

let favoriteTennisPlayer: String? = "Andy Murray"
if let player = favoriteTennisPlayer {
    print("Let's watch \(player)'s highlights video on YouTube.")
}

var winner: String? = nil
winner = "Daley Thompson"
if let name = winner {
    print("And the winner is... \(name)!")
}

var bestScore: Int? = nil
bestScore = 101
if let bestScore {
    if bestScore > 100 {
        print("You got a high score!")
    } else {
        print("Better luck next time.")
    }
}
*/

// guard let ... else ===================================================================

/*
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: 123)

func getMeaningOfLIfe() -> Int? {
    42
}

func printMeaningOfLife() {
    guard let name = getMeaningOfLIfe() else {
        print("Meaning of life still unknown")
        return
    }
    print(name)
}

printMeaningOfLife()

func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}
let input = 5
if let doubled = double(number: input) {
    print("\(input) doubled is \(doubled).")
}

func playOpera(by composer: String?) -> String? {
    guard let composer = composer else {
        return "Please spcify a composer."
    }
    if composer == "Mozart" {
        return "Le nozze di Figaro"
    } else {
        return nil
    }
}
if let opera = playOpera(by: "Mozart") {
    print(opera)
}

func playScale(name: String?) {
    guard let name = name else {
        return
    }
    print("Playing the \(name) scale.")
}
playScale(name: "C")

func verify(age: Int?) -> Bool {
    guard let age = age else {
        return false
    }
        if age >= 18 {
            return true
        } else {
            return false
        }
}
if verify(age: 28) {
    print("You're old enough.")
} else {
    print("Come back in a few years.")
}

func uppercase(string: String?) -> String? {
    guard let string = string else {
        return nil
    }
    return string.uppercased()
}
if let result = uppercase(string: "Hello") {
    print(result)
}

func isLongEnough(_ string: String?) -> Bool {
    guard let string = string else { return false }
    if string.count >= 8 {
        return true
    } else {
        return false
    }
}
if isLongEnough("Mario Odyssey") {
    print("Let's play that!")
}

func add3(to number: Int?) -> Int {
    guard let number = number else {
        return 3
    }
    return number + 3
}
let added = add3(to: nil)
print(added)

func validate(password: String?) -> Bool {
    guard let password = password else {
        return false
    }
    if password == "fr0sties" {
        print("Authenticated successfully!")
        return true
    }
    return false
}
validate(password: "fr0sties")

func test(number: Int?) {
    guard let number else { return }
    print("Number is \(number)")
}
test(number: 42)

func username(for id: Int?) -> String? {
    guard let id = id else {
        return nil
    }
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}

func describe(occupation: String?) {
    guard let occupation = occupation else {
        print("You don't have a job.")
        return
    }
    print("You are an \(occupation).")
}
let job = "engineer"
describe(occupation: job)

func plantTree(_ type: String?) {
    guard let type else {
        return
    }
    print("Planting a \(type).")
}
plantTree("willow")
*/

// Nil Coalescing ===================================================================

/*
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
print(new)

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
print(favorite)

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let number = Int(input) ?? 0
print(number)

let painter: String? = "Leonardo da Vinci"
let artist: String = painter ?? "Unknown"
print(artist)

var bestPony: String? = "Pinkie Pie"
let selectedPony: String? = bestPony ?? nil

let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

var captain: String? = "Kathryn Janeway"
let name = captain ?? "Anonymous"

let numberSum: Double? = 0.0
let sum: Double = numberSum ?? 0.0

var conferenceName: String? = "WWDC"
var conference: String? = conferenceName ?? nil

let planetNumber: Int? = 425
var destination = planetNumber ?? 3

let distanceRan: Double? = 0.5
let distance: Double = distanceRan ?? 0

var userOptedIn: Bool? = nil
var optedIn = userOptedIn ?? false

var selectedYear: Int? = nil
let actualYear = selectedYear ?? 1989
*/

// Optional Chaining ================================================

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Who has a better story than \(chosen)?")

struct Book {
    let name: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"

let credentials = ["towstraws", "fr0sties"]
let lowercaseUsername = credentials.first?.lowercased()

let songs: [String]? = [String]()
let finalSong = songs?.last?.uppercased()

func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}
let album = albumReleased(in: 2006)?.uppercased()

let attendees: [String]? = [String]()
let firstInLine = attendees?.first?.uppercased()

let shoppingList = ["eggs", "tomatoes", "grapes"]
let firstItem = shoppingList.first?.appending(" are on my shopping list.")

let captains: [String]? = ["Archer", "Lorca", "Sisko"]
let lengthOfBestCaptain = captains?.last?.count

func loadForecast(for dayNumber: Int) -> String? {
    print("Forecast unavailable")
    return nil
}
let forecast = loadForecast(for: 3)?.uppercased()

let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()

let favoriteColors = ["Paul": "Red", "Charlotte": "Pink"]
let charlotteColor = favoriteColors["Charlotte"]?.lowercased()

let opposites = ["hot": "cold", "near": "far"]
let oppositeOfLight = opposites["light"]?.uppercased()

let racers = ["Hamilton", "Verstappen", "Vettel"]
let winnerWasVE = racers.first?.hasPrefix("Ve")

// Function Failure with optionals =====================================

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)


// Checkpoint 9
// Function that accepts an optional array of integers, and returns one randomly
// if the array is missing or empty, return a random number (1...100)
// Write this function in a single line of code

var randoInts: [Int]? = [1, 4, 745, 23, 4, 24, 55, 4394520]

//func randomFromArray(_ numbers: Int?) -> Int

let randoInt = randoInts?.randomElement() ?? Int.random(in: 1...100)
print(randoInt)

func getNumber(in array: [Int]?) -> Int {
    if let array = array {
        return array.randomElement() ?? Int.random(in: 1...100)
    }
    return Int.random(in: 1...100)
}

print(getNumber(in: randoInts))

func guardNumber(in array: [Int]?) -> Int {
    let random = Int.random(in: 1...100)
    guard let array = array else {
        return random
    }
    return array.randomElement() ?? random
}


