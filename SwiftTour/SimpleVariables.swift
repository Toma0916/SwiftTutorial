// let to make constant
// var to make variable

// these must have same type as the value we want to assign to it
// we don`t always have to write the type expliditily

var myVariable = 42
print("myVariable:", myVariable)
myVariable = 50
print("myVariable:", myVariable)
let myConstant = 42
print("myConstant:", myConstant)


// specify the type by writting it after variable
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
print("type of implicitInteger: " + String(describing: type(of: implicitInteger)))
print("type of implicitDouble: " + String(describing: type(of: implicitDouble)))
print("type of explicitDouble: " + String(describing: type(of: explicitDouble)))

// values are never implicitly converted to another type
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
// let widthLabel = label + width  // you get the error "binary operator '+' cannot be applied to operands of type 'String' and 'Int'"

// simple way to include values in strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(fruitSummary)

// use threee double quotation for string that take up multiple lines
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)

// create array
var shoppingList = ["catfish", "water", "tulips"]
print(shoppingList)
// access by index
shoppingList[1] = "bottle of water"
print(shoppingList)

// create dictionary
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
// access by key
occupations["Jayne"] = "Public Relations"

// arrays automatically grow as we add elements
shoppingList.append("blue paint")
print(shoppingList)

// you can create empty array or dictionary as bellow
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
