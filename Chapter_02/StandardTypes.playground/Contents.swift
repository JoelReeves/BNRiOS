import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str

var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

var arrayOfInts: [Int]

var dictionaryOfCapitalsByCountry: [String:String]

var winningLotteryNumbers: Set<Int>

let number = 42
let fmStation = 91.1

var countingUp = ["one", "two"]
let nameByParkingSpace = [13: "Alice", 27: "Bob"]
let space42Assignee: String? = nameByParkingSpace[42]  // results in nil since key isn't in dictionary
if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dictionary")
}

for (space, name) in nameByParkingSpace {
    let permit = "Space \(space): \(name)"
    print(permit)
}

let secondElement = countingUp[1]

countingUp.count

countingUp.append("three")

for string in countingUp {
    print(string)
}

let emptyString = String()
emptyString.isEmpty

let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumer = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)

let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14 // defaults to Double
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

//let avgReading = (reading1! + reading2! + reading3!) / 3 // dangerous because program will crash if any readings are nil
if let r1 = reading1, r2 = reading2, r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading that was nil"
}


enum PieType {
    case Apple
    case Cherry
    case Pecan
}

let favoritePie = PieType.Apple

let name: String

switch favoritePie {
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Pecan:
    name = "Pecan"
}