import UIKit

// for loop
/*
let platforms = ["iOS", "macOS", "ovOS", "watchOS"]
for os in platforms {
    print("Swift works great on \(os).")
}

for platform in platforms {
    print(platform)
}

for i in 1...12 {
    print("5 x \(i) is \(5*i)")
}

for j in 12...144 {
    print("\(j) / 3 = \(Double(j)/Double(3))")
}

for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("    \(j) * \(i) is \(j * i)")
    }
    print()
}

print("Counting from 1 up to 5: ", terminator: "")
for i in 1..<5 {
    print(i, terminator: " ")
}
print()

var lyric = "Haters gonna"
for _ in 1..<6 {
    lyric += " hate"
}

print(lyric)


let names = ["Piper", "Alex", "Glenn", "Suzzette"]
print([names[1...]])
*/

// While Loop ========================================
/*
var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")

var id = Int.random(in: 1...1000)
print(id)

let amount = Double.random(in: 0...1)
print(amount)

var roll = 0

print("Rolling a 20-sided die.")
while roll != 20 {
    print("You rolled a \(roll)...")
    roll = Int.random(in: 1...20)
}

print("You rolled a \(roll)!")

*/

// Continue and Break
/*
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for file in filenames {
    if file.hasSuffix(".txt") == false {
        
    }
}

let number1 = 4
let number2 = 14
var multiples = [Int]()
var multiples2 = [Int]()
var i = 0


print(multiples)

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)

i = 1
while true {
    if i % number1 == 0 && i % number2 == 0 {
        multiples2.append(i)
    }
    i += 1
    if multiples2.count == 10 {
        break
    }
}

print(multiples2)

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]
var guess = [String]()

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let guess = [option1, option2, option3]
            
            if guess == secretCombination {
                print("The combination is \(guess)!")
                break outerLoop
            }
        }
    }
}

*/

// Checkpoint3 ==========================================
// fizz buzz
// loop from 1 - 100
// multiple of 3 print "Fizz"
// multiple of 5 print "Buzz"
// multiple of 3 & 5 print "FizzBuzz"
// otherwise print the number
/*
for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}
*/
for i in 1...100 {
    switch (i % 3 == 0, i % 5 == 0) {
    case (true, true):
        print("FizzBuzz")
    case (true, false):
        print("Fizz")
    case (false, true):
        print("Buzz")
    default:
        print(i)
    }
}
