// you represent errors using any type that adopts the error protocol
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// use throw to throw an error and throws to mark a function that can throw an error
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// one way to handle errors is to use do-catch
do {
    // let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)  // the error automatically given the name error
}

// You can provide multiple catch blocks that handle specific errors. 
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// another way to handle errors is to use try? to convert result to an optional
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {  // the code is excuted regardless of whether the function throw an error
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
var res = fridgeContains("banana")
print(fridgeIsOpen)