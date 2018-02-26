//: Playground - noun: a place where people can play

import Cocoa

let unsortedArr = [2,6,3,8,87,23,7,1,9,31,43,34,65]

//MARK: - Insertion Sort - Insert element into appropriate position on the left
func insertionSort(this array: [Int]) -> [Int] {
    return []
}

// MARK: - Bubble Sort - Swap elements repeatedly
func bubbleSort(this array: [Int]) -> [Int] {
    return []
}

// MARK: - Merge Sort - Worst: O(n), Best O(nLog(n)) Space Complexity: O(n)
// Cut array in half.  Once you have single elements arrays, merge each pair of single element arrays together.  Then, continue merging pairs together until you have one array.

func mergeSort(this array: [Int]) -> [Int] {
    guard array.count > 1 else {return array}
    let leftIndex = 0
    let rightIndex = array.count - 1
    let middle = array.count/2
    
    let leftArray = Array(array[leftIndex..<middle])
    let rightArray = Array(array[middle...rightIndex])
    return merge(lhs: mergeSort(this: leftArray), rhs: mergeSort(this: rightArray)) // Recursive, repeat until sorted
}

// MARK: - Merge Arrays
func merge(lhs: [Int], rhs: [Int]) -> [Int] {
    var mergedArr = [Int]()
    var left = lhs
    var right = rhs
    
    while !left.isEmpty && !right.isEmpty {
        if left.first! < right.first! { // left array's first item is smaller than right array first item
            mergedArr.append(left.removeFirst()) // remove item from left array and add it to mergedArr
        } else { // right array's first item is smaller than left array first item
            mergedArr.append(right.removeFirst()) // remove item from left array and add it to mergedArr
        }
    }
    print(mergedArr + left + right)
    return mergedArr + left + right // incase left and right array does not contain even amount of elements
}
mergeSort(this: unsortedArr)

// MARK: - Quick Sort - Time Complexity Average O(nLog(n)) Worst O(n^2), Space Complexity:
//Pick a pivot. Split arr into smaller, ==, bigger. Run quicksort on each piece

func quickSort(this arr: [Int]) -> [Int] {
    guard arr.count > 1 else {return arr}
    let pivot = arr[arr.count / 2]
    var left = [Int]()
    var right = [Int]()
    var middle = [Int]()
    for num in arr {
        if num < pivot {
            left.append(num)
        } else if num > pivot {
            right.append(num)
        } else {
            middle.append(pivot)
        }
    }
    return quickSort(this: left) + middle + quickSort(this: right)
}
quickSort(this: unsortedArr)















