//: [Previous](@previous)

import Foundation

extension Double {
    var asKm: Double { return self / 1000.0 }
    var asM: Double { return self }
    var asCm: Double { return self * 100.0 }
    var asMm: Double { return self * 1000.0 }
}

let length: Double = 25
length.asKm
length.asCm
length.asMm

extension Double {
    var asFt: Double {
        get { return self / 0.3048 }
        set(newValue) { self = newValue * 0.3048 }
    }
}

var distance: Double = 100
distance.asFt
distance.asFt = 150

//MARK: -

extension Int {
    func repetitions(task: () -> ()) {
        for _ in 1...self { task() }
    }
}

4.repetitions {
    print("PIU")
}

extension Int {
    mutating func squared() {
        self = self * self
    }
}

var integer = 4
integer.squared()

//MARK: -

struct Line {
    var pointOne: (Double, Double)
    var pointTwo: (Double, Double)
}

extension Double {
    init(line: Line) {
        self = sqrt(pow(line.pointTwo.0 - line.pointOne.0, 2) +
            pow(line.pointTwo.1 - line.pointOne.1, 2))
    }
}

var line = Line(pointOne: (3,4), pointTwo: (6,3))
var lineLength = Double(line: line)

//MARK: -

extension Int {
    subscript(digitIndex: Int) -> Int {
        var base = 1
        var index = digitIndex
        while index > 0 {
            base *= 10
            index -= 1
        }
        return (self / base) % 10
    }
}

85[0]
85[1]
5465646[5]
5652363263563563[12]

//MARK: -

protocol TextRepresentable {
    func asText() -> String
}

extension Int: TextRepresentable {
    func asText() -> String {
        return String(self)
    }
}

8.asText()

//MARK: -
protocol Descriptional {
    func getDescription() -> String
}

extension Descriptional {
    func getDescription() -> String {
        return "Описание объектного типа"
    }
}

class myClass: Descriptional {}
print(myClass().getDescription())

struct myStruct: Descriptional {
    func getDescription() -> String {
        return "Описание структуры"
    }
}

print(myStruct().getDescription())

//MARK: -

extension TextRepresentable {
    func about() -> String {
        return "Данный тип поддерживает протокол TextRepresentable"
    }
}

6.about()
