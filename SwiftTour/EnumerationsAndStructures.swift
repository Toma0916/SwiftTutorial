// use enum to create an enumeration
// enumerations can have methods associated with them
enum Rank: Int {
    case ace = 1  // explicitly given a raw value of 1
    // the rest of raw values are assigned in order
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print(ace)
print(aceRawValue)

// use init?(rawValue:) initializer to make an instance of an enumeration from a raw value.
if let convertedRank = Rank(rawValue: 4) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
} else {
    print("nil")
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

// Another choice for enumeration cases is to have values assciated with the case
// these values are determined when you make the instance
// they can be different for each instance of an enumeration case
enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {  // 
// switch failure {  
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}



// use struct to create a structure
// One of the most important differences between structures
// and classes is that structures are always copied when they 
// are passed around in your code, but classes are passed by reference.

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: Rank.three, suit: .spades)  // you can use abbreviated form anytime the values`s type is known
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)