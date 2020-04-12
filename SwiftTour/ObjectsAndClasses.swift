// use class followed by the class`s name to create a class
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides." 
    }
    func argumentDescription(_ numberOfSides: Int) -> String {
        return "A shape with \(numberOfSides) sides." 
    } 
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
var shapeDescription2 = shape.argumentDescription(10)
print(shapeDescription)
print(shapeDescription2)


// use init to create initializer
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name  // notice how self is used to destinguish the name property from the name argument
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// note use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated

// subclass, superclass
// method on a subclass that override the superclass`s implementation are marked with override
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {  // if you misses override, the compllier detect the error
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())


// In addition to simple properties that are stored, properties can have a getter and a setter.
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength  // Setting the value of properties that the subclass declares.
        super.init(name: name)  // Calling the superclass’s initializer.
         // Changing the value of properties defined by the superclass. 
         // Any additional setup work that uses methods, getters, or setters can also be done at this point.
        numberOfSides = 3 
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {  // the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)  // get is called
print(triangle.sideLength)
triangle.perimeter = 9.9  // set is called
print(triangle.perimeter)  // get is called
print(triangle.sideLength)


// willSet, didSet (monitor propertiy)
class Person {
    var age: Int = 0 {
        willSet {
            print("age willSet:\(age) -> \(newValue)")
        }
        didSet {
            print("age didSet :\(oldValue) -> \(age)")
        }
    }
}

let p = Person()
p.age = 10

// if the value before ? is nil, everything after ? is ingnored
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
// let optionalSquare: Square? = nil
let sideLength = optionalSquare?.sideLength
print(sideLength ?? "nil")