//: Playground - noun: a place where people can play

import Cocoa
var str = "Hello, playground"

str.components(separatedBy: " ").last

class LLNode<Key> {
    let val: Key
    var next: LLNode?
    init(val: Key) {
        self.val = val
    }
}

struct Queue<T> {
    private var head: LLNode<T>?
    private var tail: LLNode<T>?
    var isEmpty: Bool {
        return head == nil
    }
    mutating func enQueue(_ newElement: T) {
        let newNode = LLNode(val: newElement)
        guard let tail = tail else {
            self.head = newNode
            self.tail = newNode
            return
        }
        tail.next = newNode
        self.tail = newNode
    }
    mutating func deQueue() -> T? {
        guard let oldHead = head else {
            return nil
        }
        self.head = oldHead.next
        if oldHead.next == nil {
            self.tail = nil
        }
        return oldHead.val
    }
    func peek() -> T? {
        return self.head?.val
    }
}

extension String {
    static func things() {
        print(self)
    }
    func benReverse() -> String {
        var str = ""
        var arrStr = Array(self)
        print(self)
        for i in 0..<self.count {
            str += String(arrStr[self.count - i - 1])
        }
        return str
    }
}

String.things()

//multiply two numbers without using "*"

func multiply(_ numOne: Int, and numTwo: Int) -> Int {
    //Handle Negatives
    var numOne = numOne
    var numTwo = numTwo
    if (numOne < 0 && numTwo < 0) || (numOne > 0 && numTwo < 0) {
        numOne = -numOne
        numTwo = -numTwo
    }
    //Base cases
    if numOne == 0 || numTwo == 0 { return 0 }
    if numOne == 1 { return numTwo }
    if numTwo == 1 { return numOne }
    //Recursive call
    return numOne + multiply(numOne, and: numTwo - 1)
}

multiply(-5, and: -3)


var add = {(a: Int, b: Int) -> Int in
    return a + b
}

add(4, 3)

var add2: (Int, Int) -> Int = {(a,b) in a + b}
add2(4,1)

var add3: (Int, Int) -> Int = {$0 + $1}
add3(4,5)

add = {$0 + $1}

var arr = [1,5,12,5,12,3,412,31,2]

var myUrls = [URL(string: "www.otherplace.com")!, URL(string: "www.place.com")! ]

try? myUrls.filter{(url) in
    do {
        let str = try String(contentsOf: url)
        return str.first == "A"
    }
    catch {
        throw error
    }
}


arr.map{Double($0)}
print(arr.reduce(0){(currentSum: Int, nextVal: Int) -> Int in
    let newSum = currentSum + nextVal
    return newSum
})

print(arr.sorted{String($0) < String($1)})


var nestedThing = [[[3],[3,42,321],[32]],[[4,23]]]
print(nestedThing.flatMap{$0}.flatMap{$0})
print("nested")

//Bubble Sort - Swap elements repeatedly
//Insertion Sort - Insert element into appropriate position on the left
//Quicksort - Pick a pivot.  Split arr into smaller, ==, bigger.  Run quicksort on each piece
//Mergesort - Cut array in half.  Once you have single elements arrays, merge each pair of single element arrays together.  Then, continue merging pairs together until you have one array.

class TreeNode<T> {
    var val: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?
    init(val: T) {
        self.val = val
    }
}

let root = TreeNode(val: 0)
let nodeOne = TreeNode(val: 1)
let nodeTwo = TreeNode(val: 2)
let nodeThree = TreeNode(val: 3)
let nodeFour = TreeNode(val: 4)
let nodeFive = TreeNode(val: 5)

root.left = nodeOne
root.right = nodeTwo
nodeOne.left = nodeThree
nodeTwo.left = nodeFour
nodeTwo.right = nodeFive

func dfs<T>(root: TreeNode<T>) {
    if let left = root.left {
        dfs(root: left)
    }
    if let right = root.right {
        dfs(root: right)
    }
    print(root.val)
}

func bfs<T>(root: TreeNode<T>) {
    var myQ = Queue<TreeNode<T>>()
    myQ.enQueue(root)
    while !myQ.isEmpty {
        let currentNode = myQ.deQueue()!
        print(currentNode.val)
        if let left = currentNode.left {
            myQ.enQueue(left)
        }
        if let right = currentNode.right {
            myQ.enQueue(right)
        }
    }
}

bfs(root: root)


var matrix = [[2,4,2,1],
              [4,1,3,6],
              [0,1,4,1],
              [-10,-49,4238,32]]

func sumWithoutBorders(of matrix: [[Int]]) -> Int {
    var sum = 0
    for (index, row) in matrix.enumerated() where index != 0 && index != matrix.count - 1 {
        sum += row[1..<row.count - 1].reduce(0, +)
    }
    return sum
}

sumWithoutBorders(of: matrix)

func enumerate(arr: [String]) -> [(Int, String)] {
    var newArr = [(Int, String)]()
    for i in 0..<arr.count {
        newArr.append( (i, arr[i]) )
    }
    return newArr
}
