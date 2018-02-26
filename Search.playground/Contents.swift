//: Playground - noun: a place where people can play

import Cocoa

// Binary Search
func binarySearch(search value: Int, arr: [Int]) -> Bool {
    
    var leftIndex = 0
    var rightIndex = arr.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        if arr[middleIndex] == value {
            return true
        }
        if value < arr[middleIndex] {
            rightIndex = middleIndex - 1
        }
        if value > arr[middleIndex] {
            leftIndex = middleIndex + 1
        }
    }
    return false
}

let arr = [1,2,3,4,5,6,7,8,9]
binarySearch(search: 8, arr: arr)

