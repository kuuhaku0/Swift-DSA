//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

public class Node<T: Equatable> {
    var key: T
    var next: Node?
    init(key: T) {
        self.key = key
    }
}

public class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard !self.isEmpty else {
            return 0
        }
        var count = 0
        var currentNode = head
        while currentNode != nil {
            count += 1
            currentNode = currentNode?.next
        }
        return count
    }
    
    // INSERT
    public func append(element newKey: T) {
        guard !self.isEmpty else {
            head = Node(key: newKey)
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(key: newKey)
    }
    
    public func insert(element newNode: Node<T>, at index: Int) {
        let newNode = newNode
        var currentIndex = 0
        var currentNode = head
        if index == 0 {
            self.head = newNode
            self.head?.next = currentNode
        }
        while currentNode != nil {
            currentIndex += 1
            if currentIndex == index {
                newNode.next = currentNode?.next
                currentNode?.next = newNode
            } else {
                currentNode = currentNode?.next
            }
        }
    }
    
    // DELETE
    public func deleteAll() {
        self.head = nil
    }
    
    public func dropFirst() {
        self.head = head?.next
    }
    
    public func dropLast() {
        guard head?.next != nil else {
            head = nil
            return
        }
        var currentNode = head
        while currentNode?.next?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = nil
    }
    
    public func remove(element index: Int) {
        var currentIndex = 0
        var currentNode = head
        guard index <= count - 1 else {
            return
        }
        if index == 0 {
            deleteAll()
        }
        while currentNode != nil {
            currentIndex += 1
            if currentIndex == index {
                currentNode?.next = currentNode?.next?.next
            } else {
                currentNode = currentNode?.next
            }
        }
    }
    
    // FETCH
    public func getItem(element index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        guard index <= count - 1 else {
            return nil
        }
        while currentNode != nil {
            if currentIndex == index {
                return currentNode
            } else {
                currentIndex += 1
                currentNode = currentNode?.next
            }
        }
        return currentNode
    }
    
    public func toArr() -> [T] {
        var arr = [T]()
        var currentNode = head
        while currentNode != nil {
            arr.append(currentNode!.key)
            currentNode = currentNode?.next
        }
        return arr
    }
    
    func printAllKeys() {
        var str = ""
        var currentNode = self.head
        while currentNode != nil {
            str += "\(currentNode!.key) --> "
            currentNode = currentNode!.next
        }
        str += "nil"
        print(str)
    }
    
    // MUTATE
    public func reverse() {
        var prev: Node<T>? = nil
        var currentNode = head
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = prev
            prev = currentNode
            currentNode = nextNode
        }
        self.head = prev
    }
    
    // fun function for reversing sections of a Linkedlist ex: 1 -> 2 -> 3 - 4 -> nil, groupedBy: 2 returns 2 -> 1 -> 4 -> 3 -> nil
    func reverseInGroups(node: Node<T>? , previousTail: Node<T>? = nil, groupedBy num: Int) {
        var current = node
        let prevTail = current
        var prev: Node<T>?
        var next: Node<T>?
        
        var count = 0
        
        while current != nil && count < num {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
            count += 1
        }
        previousTail?.next = prev
        if next != nil {
            self.reverseInGroups(node: next, previousTail: prevTail, groupedBy: num)
        }
        head = prev
    }
}

let head = Node.init(key: 5)
head.key
let node2 = Node(key: 2)
let node3 = Node(key: 6)
let node4 = Node(key: 4)
let node5 = Node(key: 9)

let myLL = LinkedList<Int>()
myLL.head = head
head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
myLL.append(element: 6)

myLL.printAllKeys()
myLL.getItem(element: 6)
print(myLL.toArr())
myLL.remove(element: 1)
print(myLL.toArr())
myLL.dropFirst()
myLL.toArr()
myLL.insert(element: Node.init(key: 1), at: 3)
myLL.toArr()
myLL.append(element: 3)
myLL.printAllKeys()
myLL.reverseInGroups(node: myLL.head, previousTail: nil, groupedBy: 2)
myLL.printAllKeys()

