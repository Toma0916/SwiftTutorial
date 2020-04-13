// write a name inside angle brackets to make a gineric function or type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
print(makeArray(repeating: "knock", numberOfTimes: 4))


// You can make generic forms of functions and methods,
// as well as classes, enumerations, and structures.
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
print(possibleInteger)
possibleInteger = .some(100)
print(possibleInteger)


// use where right before the body to specify a list of requirements
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
print(anyCommonElements([1, 2, 3], [3]))


// you can use generics in protocol
protocol Appendable {
    associatedtype Element
    var elements: [Element] { get }
    func append(element:Element)
}
class SomeAppendableClass<T>:Appendable {
    typealias Element = T
    var elements: [Element]

    init(elements: [Element]) {
        self.elements = elements
    }

    func append(element: Element) {
        elements.append(element)
    }
}
// Int
let intAppendableClass = SomeAppendableClass<Int>(elements: [3, 4, 9])
print(intAppendableClass.elements)
intAppendableClass.append(element: 7)
print(intAppendableClass.elements)

// String
// you can ommit <> if type of arguments are obvious.
let stringAppendableClass = SomeAppendableClass(elements: ["a", "b", "c"])
print(stringAppendableClass.elements)
stringAppendableClass.append(element: "d")
print(stringAppendableClass.elements)
