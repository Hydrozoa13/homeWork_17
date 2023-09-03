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

var test3 = RandomGenerator.init()
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

var test4 = RandomGeneratorClass.init()
test4.randomCollection
test4.getRandomNumber()
test4.setNewRandomCollection(newValue: [16,17,18,19,20])
test4.randomCollection
test4.getRandomNumber()

//MARK: -




//: [Next](@next)
