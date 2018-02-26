//: Playground - noun: a place where people can play

import Cocoa

// Factorial
func factorial(_ num: Int) -> Int {
    if num == 1 {
        return 1
    } else {
        return num * factorial(num - 1)
    }
}
factorial(5)

// Fibbonacci sequence
func fibForNumSteps(from num: Int) -> [Int] {
    var sequence = [0,1]
    if num <= 1 {
        return sequence
    }
    for _ in 0...num - 2 {
        let first = sequence[sequence.count - 2]
        let second = sequence.last!
        sequence.append(first + second)
    }
    return sequence
}
fibForNumSteps(from: 2)

func fibRecursion(from num: Int, first: Int, second: Int) -> [Int] {
    if num == 0 {return []}
    return [first + second] + fibRecursion(from: num - 1,
                                           first: second,
                                           second: first + second)
}
