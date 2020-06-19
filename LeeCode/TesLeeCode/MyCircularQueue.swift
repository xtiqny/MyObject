//
//  MyCircularQueue.swift
//  TesLeeCode
//
//  Created by 张耀 on 2020/5/25.
//  Copyright © 2020 张耀. All rights reserved.
//

import UIKit

class MyCircularQueue: NSObject {
    var array:[Int] = []
    var curLength = 0
    var length = 0
    
    var startIndex = 0
    var endIndex = -1
    
    init(_ k:Int)
    {
        length = k
        for _ in 1...k
        {
            array.append(0)
        }
    }
    
    func enQueue(_ value:Int) -> Bool
    {
        if isFull()
        {
            return false;
        }
        else{
            endIndex = (endIndex + 1) % length
            array[endIndex] = value
            
            curLength += 1
            return true;
        }
    }
    
    func deQueue() -> Bool
    {
        if isEmpty() {
            return false
        }
        else
        {
            startIndex = (startIndex + 1) % length
            curLength -= 1;
            return true
        }
    }
    
    func Front() -> Int {
        if isEmpty() {
            return -1
        }
        else
        {
            return array[startIndex]
        }
    }
    
    func Rear() -> Int {
        if curLength == 0 {
            return -1
        }
        else
        {
            return array[endIndex]
        }
    }
    
    func isEmpty() -> Bool {
        if curLength == 0 {
            return true
        }
        else
        {
            return false;
        }
    }
    
    func isFull() -> Bool {
        if curLength ==  length{
            return true
        }
        else
        {
            return false
        }
    }
}


class MyQueue :NSObject{
    
    var mainStack = MyStackcc()
    var temStack = MyStackcc()
    

    /** Initialize your data structure here. */
    override init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        mainStack.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
       return mainStack.pop()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return mainStack.peek()
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return mainStack.isEmpty()
    }
}


class MyStackcc: NSObject{
    var array = [Int]()
    
    func push(_ x:Int)  {
        array.append(x)
    }
    
    func pop() -> Int {
        return array.removeFirst()
    }
    
    func peek() -> Int {
        return array.first!
    }
    
    func isEmpty() -> Bool{
        return array.isEmpty;
    }
    
    func size() -> Int {
        return array.count;
    }
}


 func isPalindrome(_ s: String) -> Bool {
    if s.count <= 0 {
        return false
    }
    
    var strArray = [Character]()
    
    
    for str in s.lowercased() {
        if (str >= "a" && str <= "9") || (str >= "a" && str<="z"){
            strArray.append(str)
        }
    }
    
    let len = strArray.count
    for i in 0..<strArray.count{
        if strArray[i] != strArray[len - i - 1]
        {
            return false
        }
    }
    return true
}


