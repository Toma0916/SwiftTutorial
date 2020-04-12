// use protocol to declare a protocol (like interface)
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// classes, enumerations, and structs can all adopt protocols
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
let aDescription1 = a.simpleDescription
print(aDescription1)
a.adjust()
let aDescription2 = a.simpleDescription
print(aDescription2)
a.adjust()
let aDescription3 = a.simpleDescription
print(aDescription3)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// the use of the mutating keyword in the declaration of SimpleStructure to mark a method
// that modifies the structure.
// the declaration of SimpleClass doesn`t need any of its methods marked as 
// mutating because methods on class can always modify the class


// use extention to add functionally to an existing type
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
var testNum = 9
testNum.adjust()
print(testNum.simpleDescription)

// you can use a protocol name just like any other names type
// methods outside the protocol definition are not available
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// Prints "A very simple class.  Now 100% adjusted."
// print(protocolValue.anotherProperty)  // Uncomment to see the error