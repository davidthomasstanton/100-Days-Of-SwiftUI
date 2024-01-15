import UIKit

/*
func greet(_ name: String, times: Int) -> (person: String, timesGreeted: Int) {
    for i in 1...times {
        print("Morning \(name)!")
    }
    return (name, times)
}

let greeting = greet("David", times: 3)

print("Greeted \(greeting.person), \(greeting.timesGreeted) times.")

let (invitee, invitedTimes) = greet("Margaret", times: 3)

*/

// Default Values for Parameters =============================
/*
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(for: 12)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)
*/
// How to Handle Errors ==============================
// enum PasswordError
/*
enum PasswordError: Error {
    case short
    case obvious
}
 
// function to check password
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    return "\"\(password)\" looks good."
}

// set a password and catch errors
let password = "1256"

do {
    let passTry = try checkPassword(password)
    print(passTry)
} catch PasswordError.short {
    print("Password must be longer than 5 characters")
} catch PasswordError.obvious {
    print("Password cannot be 12345")
}
*/

/*
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

*/

// Write a function that accepts an integer from 1 through 10,000, returns the integer square root of that number.

enum SquareErrors: Error {
    case tooSmall, tooLarge, noRoot
}

func findRoot(_ num: Int) throws -> Int {
    if num < 1 { throw SquareErrors.tooSmall }
    if num > 10_000 { throw SquareErrors.tooLarge }
    
    for i in 1...100 {
        if i * i == num {
            return i
        }
    }
    throw SquareErrors.noRoot
}

let number = 484

do {
    let result = try findRoot(number)
    print("The square root of \(number) is \(result).")
} catch SquareErrors.tooSmall {
    print("\(number) must be from 1 to 10,000")
} catch SquareErrors.tooLarge {
    print("\(number) must be from 1 to 10,000")
} catch SquareErrors.noRoot {
    print("There is no integer square root of \(number).")
}


