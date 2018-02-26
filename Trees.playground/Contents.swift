//: Playground - noun: a place where people can play

import Cocoa

// LinkedList Node
class Node<T> {
    var key: T
    var next: Node?
    init(key: T) {
        self.key = key
    }
}

// LinkedList for Queue
class LinkedList<T> {
    public var head: Node<T>?
    public var count: Int {
        guard head != nil else {return 0}
        var currentNode = head
        var count = 0
        while currentNode != nil {
            count += 1
            currentNode = currentNode?.next
        }
        return count
    }
    public var isEmpty: Bool {return self.head == nil}
    public func append(element node: Node<T>) {
        guard head != nil else {
            head = node
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = node
    }
    public func dropFirst() -> T? {
        guard let oldHead = head else {return nil}
        self.head = oldHead.next
        return oldHead.key
    }
}

// Queue for Breadth first traversal
struct Queue<T> {
    private var arr = LinkedList<T>()
    public var count: Int {return arr.count}
    public var isEmpty: Bool {return arr.isEmpty}
    
    public mutating func enQueue(_ element: T) {
        arr.append(element: Node(key: element))
    }
    public mutating func deQueue() -> T? {
        guard !arr.isEmpty else {return nil}
        return arr.dropFirst()
    }
    public func peek() -> T? {
        return arr.head?.key
    }
}

// Binary Tree
enum Order {
    case inOrder
    case preOrder
    case postOrder
}

class NumberTreeNode {
    var key: Int
    var left: NumberTreeNode?
    var right: NumberTreeNode?
    init(key: Int) {
        self.key = key
    }
    public func insert(_ value: Int) {
        if value <= key { // left side
            if left == nil {left = NumberTreeNode(key: value)} else {left?.insert(value)}}
        else { //value > key, right side
            if right == nil {right = NumberTreeNode(key: value)}
            else {right?.insert(value)}}
    }
    
    public func contains(value: Int) -> Bool {
        if value == key { return true } else if value < key {
            if left == nil { return false }
            else {return left!.contains(value: value)}} // go down a level on left
            
        else { //value less than key
            if right == nil {return false}
            else {return right!.contains(value:value)}} // go down a level on right
    }
    public func printInOrder(order: Order) {
        //preorder
        switch order {
        case .preOrder:
            print(key)
            left?.printInOrder(order: .preOrder)
            right?.printInOrder(order: .preOrder)
        case .inOrder:
            left?.printInOrder(order: .inOrder)
            print(key)
            right?.printInOrder(order: .inOrder)
        case .postOrder:
            left?.printInOrder(order: .postOrder)
            right?.printInOrder(order: .postOrder)
            print(key)
        }
    }
}

class BinaryTreeNode<T> {
    var key: T
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    init(key: T) {
        self.key = key
    }
    
    public func preOrderDepthFirstTraversal() {
        left?.preOrderDepthFirstTraversal()
        print(key)
        right?.preOrderDepthFirstTraversal()
    }
    public func inOrderDepthFirstTraversal() {
        print(key)
        left?.inOrderDepthFirstTraversal()
        right?.inOrderDepthFirstTraversal()
    }
    public func postOrderDepthFirstTraversal() {
        left?.postOrderDepthFirstTraversal()
        right?.postOrderDepthFirstTraversal()
        print(key)
    }
}

class BinaryTree<T> {
    var root: BinaryTreeNode<T>?
    var numRoot: NumberTreeNode?
    
    public func breadthFirstTraversal() {
        guard let root = self.root else {return}
        var processQueue = Queue<BinaryTreeNode<T>>()
        processQueue.enQueue(root) // enQueue root node to execute loop
        while !processQueue.isEmpty {
            let currentNode = processQueue.deQueue()! // returns BinaryTreeNode of each level from left to right
            print(currentNode.key)
            if let leftNode = currentNode.left { // if there is more left node
                processQueue.enQueue(leftNode)
            }
            if let rightNode = currentNode.right { // if there is more right node
                processQueue.enQueue(rightNode)
            }
        }
    }
    public func depthFirstTraversal(in order: Order) {
        guard let root = root else {return}
        switch order {
        case .preOrder:
            root.preOrderDepthFirstTraversal()
        case .inOrder:
            root.inOrderDepthFirstTraversal()
        case .postOrder:
            root.postOrderDepthFirstTraversal()
        }
    }
}
//BinaryTreeNode
let tree = BinaryTree<Int>()
let root = BinaryTreeNode(key: 0)
let nodeOne = BinaryTreeNode(key: 1)
let nodeTwo = BinaryTreeNode(key: 2)
let nodeThree = BinaryTreeNode(key: 3)
let nodeFour = BinaryTreeNode(key: 4)
let nodeFive = BinaryTreeNode(key: 5)
let nodeSix = BinaryTreeNode(key: 6)

tree.root = root
root.left = nodeOne
root.right = nodeTwo
nodeOne.left = nodeThree
nodeOne.right = nodeFour
nodeFour.right = nodeSix
nodeTwo.right = nodeFive
tree.breadthFirstTraversal()
//print()
//tree.depthFirstTraversal(in: .inOrder)

/************************************/
//NumberTreeNode that contain only Integers
//Call insert function to automatically insert in sorted order of BST

let numTree = BinaryTree<Int>()
let numRoot = NumberTreeNode(key: 1)
numTree.numRoot = numRoot
numTree.numRoot?.insert(2)
numTree.numRoot?.insert(3)
numTree.numRoot?.insert(6)
numTree.numRoot?.insert(4)
numTree.numRoot?.insert(9)
numTree.numRoot?.insert(11)
//
//numTree.numRoot?.contains(value: 9)
//print("numTree")
//numTree.numRoot?.printInOrder(order: .inOrder)

