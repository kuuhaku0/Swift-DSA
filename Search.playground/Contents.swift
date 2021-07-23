//: Playground - noun: a place where people can play

import Cocoa

// Binary Search
extension Array where Element:Comparable {
    
    //searches all elements in the array
    func binarySearch(search value:Element)->(index:Int?,exists:Bool) {
        
        var lowIndex = 0
        var highIndex = self.count - 1
        
        while lowIndex <= highIndex {
            
            let middleIndex = lowIndex + (highIndex - lowIndex) / 2
            
            if self[middleIndex] < value {
                
                lowIndex = middleIndex + 1
                
            } else if self[middleIndex] > value {
                
                highIndex = middleIndex - 1
                
            } else {
                
                return (middleIndex,true)
                
            }
            
        }
        
        return (nil,false)
    }
    
    
    //seraches specific range of elements in the array
    func binarySearch(search value:Element,in range:ClosedRange<Int>)->(index:Int?,exists:Bool) {
    
        var lowIndex = range.lowerBound
        var highIndex = range.upperBound
      
        if lowIndex < 0 { lowIndex = 0 }
        if highIndex >= self.count { highIndex = self.count - 1 }
        
        while lowIndex <= highIndex {
            
            let middleIndex = lowIndex + (highIndex - lowIndex) / 2
            
            if self[middleIndex] < value {
                
                lowIndex = middleIndex + 1
                
            } else if self[middleIndex] > value {
                
                highIndex = middleIndex - 1
                
            } else {
                
                return (middleIndex,true)
                
            }
            
        }
        
        return (nil,false)
        
    }
    
}
[1,2,3,4,5,6,7,8,9].binarySearch(search: 9, in: 3...9)

