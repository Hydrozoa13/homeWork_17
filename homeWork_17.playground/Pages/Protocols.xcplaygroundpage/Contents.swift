import Foundation

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

struct SomeStruct: SomeProtocol {
    var mustBeSettable: Int
    let doesNotNeedToBeSettable: Int
    func getSum() -> Int {
        return self.mustBeSettable + self.doesNotNeedToBeSettable
    }
}

let test1 = SomeStruct(mustBeSettable: 9, doesNotNeedToBeSettable: 4)
test1.getSum()

//MARK: -

protocol AnotherProtocol {
    static var someTypeProperty: Int { get }
}

struct AnotherStruct: SomeProtocol, AnotherProtocol {
    var mustBeSettable: Int
    let doesNotNeedToBeSettable: Int
    static var someTypeProperty = 3
    func getSum() -> Int {
        return mustBeSettable
            + doesNotNeedToBeSettable
            + AnotherStruct.someTypeProperty
    }
}

let test2 = AnotherStruct(mustBeSettable: 1, doesNotNeedToBeSettable: 5)
test2.getSum()

//MARK: -

protocol RandomNumberGenerator {
    var randomCollection: [Int] { get set }
    func getRandomNumber() -> Int
    mutating func setNewRandomCollection(newValue: [Int])
}

struct RandomGenerator: RandomNumberGenerator {
    var randomCollection: [Int] = [1,2,3,4,5]
    func getRandomNumber() -> Int {
        if let randomElement = randomCollection.randomElement() {
            return randomElement
        }
        return 0
    }
    mutating func setNewRandomCollection(newValue: [Int]) {
        self.randomCollection = newValue
    }
}

var test3 = RandomGenerator()
test3.randomCollection
test3.getRandomNumber()
test3.setNewRandomCollection(newValue: [6,7,8,9,10])
test3.randomCollection
test3.getRandomNumber()

class RandomGeneratorClass: RandomNumberGenerator {
    var randomCollection: [Int] = [11,12,13,14,15]
    func getRandomNumber() -> Int {
        if let randomElement = randomCollection.randomElement() {
            return randomElement
        }
        return 0
    }
    func setNewRandomCollection(newValue: [Int]) {
        self.randomCollection = newValue
    }
}

var test4 = RandomGeneratorClass()
test4.randomCollection
test4.getRandomNumber()
test4.setNewRandomCollection(newValue: [16,17,18,19,20])
test4.randomCollection
test4.getRandomNumber()

//MARK: -

protocol Named {
    init(name: String)
}

class Person: Named {
    required init(name: String) {
        self.name = name
    }
    var name: String
}

let test5 = Person(name: "Evgeny")
test5.name

//MARK: -

func getHash<T: Hashable>(of value: T) -> Int {
    return value.hashValue
}

getHash(of: 6)
getHash(of: "Hello")
getHash(of: true)
getHash(of: "A")

//MARK: -

protocol HasValue {
    var value: Int { get set }
}

class ClassWithValue: HasValue {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

struct StructWithValue: HasValue {
    var value: Int
}

let objects: [Any] = [
    2,
    StructWithValue(value: 6),
    true,
    ClassWithValue(value: 21),
    "Evgeny"
]

for object in objects {
    if let elementWithValue = object as? HasValue {
        print("Значение \(elementWithValue.value)")
    }
}

for object in objects {
    print(object is HasValue)
}

//MARK: -

protocol GeometricFigureWithXAxis {
    var x: Int { get set }
}

protocol GeometricFigureWithYAxis {
    var y: Int { get set }
}

protocol GeometricFigureTwoAxis: GeometricFigureWithXAxis,
                                     GeometricFigureWithYAxis {
    var distanceFromCenter: Float { get }
}

struct Figure2D: GeometricFigureTwoAxis {
    var x: Int = 0
    var y: Int = 0
    var distanceFromCenter: Float {
        let xPow = pow(Double(self.x), 2)
        let yPow = pow(Double(self.y), 2)
        let length = sqrt(xPow + yPow)
        return Float(length)
    }
}

let test6 = Figure2D(x: 4, y: 3)
test6.distanceFromCenter

//MARK: -

protocol SuperProtocol {}
protocol SubProtocol: class, SuperProtocol {}

class ClassWithProtocol: SubProtocol {}
//struct StructWithProtocol: SubProtocol {}

//MARK: -

protocol Name {
    var name: String { get }
}

protocol Age {
    var age: Int { get }
}

struct Persona: Name, Age {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: Name & Age) {
    print("С Днем Рождения \(celebrator.name)! Тебе уже \(celebrator.age)!")
}

let person = Persona(name: "Evgeny", age: 23)
wishHappyBirthday(celebrator: person)

//: [Next](@next)
