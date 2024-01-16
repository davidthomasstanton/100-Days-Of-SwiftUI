import UIKit

// function that checks if a number has an integral square root
/*
enum SquareErrors: Error {
    case tooSmall, tooLarge, noRoot
}

func checkSquare(_ num: Int) throws -> Int {
    if num < 1 { throw SquareErrors.tooSmall }
    if num > 10_000 { throw SquareErrors.tooLarge }
    
    for i in 1...100 {
        if i * i == num {
            return i
        }
    }
    throw SquareErrors.noRoot
}

let number = 25

do {
    let result = try checkSquare(number)
    print("The square of \(number) is \(result).")
} catch SquareErrors.tooSmall {
    print("\(number) is not between 1 and 10,000.")
} catch SquareErrors.tooLarge {
    print("\(number) is not between 1 and 10,000.")
} catch SquareErrors.noRoot {
    print("There is no integer square root of \(number).")
}
*/

/*
func greetUser() {
    print("Hi there!")
}

greetUser()


var greetCopy: () -> Void = greetUser

greetCopy()
*/

/*
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}


var sayHelloCopy: (String) -> String = sayHello

func getUserDaata(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserDaata
let user = data(1989)
print(user)


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)
let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else  if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

print(captainFirstTeam)

let reversedTeam = team.sorted { $0 > $1 }

let tOnly = team.filter { $0.hasPrefix("T") }

print(tOnly)

let uppercassedTeam = team.map { $0.uppercased() }

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let newRolls = makeArray(size: 5, using: generateNumber)
print(newRolls)

// function that accepts three functions
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second workd")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

let cannonBall = {
    print("CANNON-BALL!")
}

let swanDive = {
    print("Graceful swan-dive!")
}
func performDive(using dive: () -> Void) {
    print("I'm climing up to the top...")
    dive()
}

performDive(using: swanDive)

var playCurtain = {
    print("Move hand along outside of curtain.")
}

var playFeather = {
    print("Wave peacock feather around.")
}

func playWithKip(using playType: () -> Void) {
    print("Going to play with Kip by: ")
    playType()
}

playWithKip(using: playCurtain)
playWithKip(using: playFeather)

var onBike = {
    print("Let's ride!")
}

var onSkates = {
    print("Tubular.")
}

func travelBy(using mode: () -> Void) {
    print("Ready to go?")
    mode()
}

travelBy(using: onBike)
travelBy(using: onSkates)

let resignation = { (name: String) in
    print("Dear \(name), I'm outta here!")
}

let promotion = { (name: String) in
    print("Dear \(name), I need a promotion.")
}

func businessLetter(to name: String, ask: (String) -> Void) {
    ask(name)
}

businessLetter(to: "tOG", ask: resignation)

func doTricks(_ tricks: () -> Void) {
    print("Start recording now!")
    tricks()
    print("Did you get all that?")
}

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}

tendGarden {
    print("Let's grow some roses!")
}

func repeatAction(count: Int, then action: () -> Void) {
    for _ in 0..<count {
        action()
    }
}

repeatAction(count: 5) {
    print("Hello!")
}
*/

// input an array,
// Filter out any numbers are even
// Sort the array in ascending order
// Map them to strings in the format "7 is a lucky number"
// Print the resulting array, one item per line

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func formatNumbers(_ numArray: [Int]) {
    var adjustedArray = numArray.filter { $0 % 2 != 0 }
                                .sorted { $0 < $1 }
                                .map { "\($0) is a lucky number" }
    
    for i in 0..<adjustedArray.count {
        print(adjustedArray[i])
    }
}

formatNumbers(luckyNumbers)

// filter, sort, map
//luckyNumbers.filter { $0.isMultiple(of: 2) == false }.sorted { $0 < $1 }.map { "\($0) is a lucky number" }.forEach { print($0) }


// filter, sort map
luckyNumbers.filter { $0.isMultiple(of: 2) == false }.sorted().map { "\($0) is a lucky number" }.forEach { print($0) }


/*
// password
enum PasswordErrors: Error {
    case tooShort, tooLong, tooEasy
}

func checkPassword(_ pass: String) throws -> Bool {
    if pass.count < 5 { throw PasswordErrors.tooShort }
    if pass.count > 15 { throw PasswordErrors.tooLong }
    if pass == "12345" { throw PasswordErrors.tooEasy }
    return true
}

let password = "12325342"

do {
    let result = try checkPassword(password)
    print("Your password of \(password) is acceptable.")
} catch PasswordErrors.tooShort {
    print("Your password must be at least 5 digits long.")
} catch PasswordErrors.tooLong {
    print("Your password must be shorter than 15 digits.")
} catch PasswordErrors.tooEasy {
    print("Your password cannot be \"12345\"")
}

*/
