// use if and switch to make conditionals
// use for-in, while, repeat-while to make loops

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {  // the conditional must be a Boolean expression
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// Optional: optional value can contain a value or nil to indicate that a value is missing
// write a ? after the type of a value to mark the calue as optional
var optionalString: String? = "Hello"
print(optionalString == nil)  // "false"

var optionalName: String? = "John Appleseed"
// var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {  // if optionalName is nil, the code in braces is skipped
    greeting = "Hello, \(name)"  // otherwise, the optional value is unwrapped and assigned to the constant after let
    print(greeting)
}
// print(name)  // you get the error "use of unresolved identifier 'name'"

// provide default value using the ?? operator
let nickName: String? = nil
let fullName: String = "John Appleseed"
// If the optional value is missing, the default value is used instead.
let informalGreeting = "Hi \(nickName ?? fullName)"  


// switch
// After executing the code inside the switch case that matched, 
// the program exits from the switch statement. Execution doesn’t
// continue to the next case, so there is no need to explicitly break
//  out of the switch at the end of each case’s code.
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// for-in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// while
var n = 2
while n < 100 {
    n *= 2
}
print(n)

// repeat-while
// ensure that the loop is run at least once.
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// You can keep an index in a loop by using ..< to make a range of indexes.
var total = 0
for i in 0..<4 {
    total += i
}
print(total)  // 1 + 2 + 3

