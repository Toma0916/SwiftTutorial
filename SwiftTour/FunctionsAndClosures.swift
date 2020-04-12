// use Func to declare a function

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "toma", day: "Sunday"))

// custom argument label before the parameter name
// _ to use no argument label
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet("John", on: "Wednesday"))


// use tuple to make conpound values
// element of tuple can be reffered to either by name or by number
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)  // 120
print(statistics.0)  // 3

// functions can be nested
// nested functions have acceess to variables that were declared inthe outer functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5  // the func "add" have acceess to the variable "y"
    }
    add()
    return y
}
print(returnFifteen())

// function can return another function as its value
// (function can take another function as oone of its arguments)
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))


// functions are actually a special case of closures
var numbers = [20, 19, 7, 12]
let mappedNumbers = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
// you can omit the type of its parameters, its return type, or both.
// single statement closures implicitly return the value of their only statement
let mappedNumbers2 = numbers.map({ number in 3 * number })
print(numbers)
print(mappedNumbers)
print(mappedNumbers2)

// you can refer to parameters by number instead of name
// When a closure is the only argument to a function, you can omit the parentheses entirely.
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
