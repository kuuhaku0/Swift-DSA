//: Playground - noun: a place where people can play

import Cocoa

class BinaryTree {
    var left: BinaryTree?
    var root: Int?
    var right: BinaryTree?
    init(_ root: Int) {
        self.root = root
    }
    
    public func insert(value: Int) {
        guard let root = root else {return}
        
        if value <= root {
            if left == nil {
                left = BinaryTree(value)
            } else {
                left?.insert(value: value)
            }
        } else {
            if right == nil {
                right = BinaryTree(value)
            } else {
                right?.insert(value: value)
            }
        }
    }
    
    public func contains(value: Int) -> Bool {
        guard let root = root else {return false}
        if value == root {
            return true
        } else if value < root {
            if left == nil {
                return false
            } else {
                return left!.contains(value: value)
            }
        } else {
            if right == nil {
                return false
            } else {
                return right!.contains(value:value)
            }
        }
    }
    
    public func printInOrder() {
        guard let root = root else {return}
        //preorder
        print(root)
        if left != nil {
            left?.printInOrder()
        }
        //inorder
        //print(root)
        if right != nil {
            right?.printInOrder()
        }
        //postorder
        //print(root)
        
    }
    
    //    public func delete(value: Int) {
    //        guard let root = root else {return}
    ////        if root == value {
    ////            if left == nil && right == nil {
    ////                self.root = nil
    ////            } else if left == nil {
    ////
    ////            }
    ////        }
    //        if value < root {
    //            guard let left = left else {return}
    //            if left.root == value && left.left == nil && left.right == nil {
    //                left.root = nil
    //            } else if left.root == value && left.left == nil {
    //
    //            }
    //        } else if value > root {
    //            right?.delete(value: value)
    //        }
    //    }
    }

    var root = BinaryTree(5)
    root.insert(value: 2)
    root.insert(value: 3)
    root.insert(value: 4)
    root.insert(value: 1)
    root.insert(value: 10)
    root.insert(value: 7)
    root.insert(value: 6)
    root.insert(value: 8)
    root.insert(value: 12)
    root.insert(value: 12)
    
    root.printInOrder()

//let root = TreeNode(1)
//let nodeTwo = TreeNode(2)
//let nodeThree = TreeNode(3)
//let nodeFour = TreeNode(4)
//let nodeFive = TreeNode(5)
//
//root.left = nodeTwo
//root.right = nodeThree
//nodeTwo.left = nodeFour
//nodeTwo.right = nodeFive
