//
//  MyStack.swift
//  TesLeeCode
//
//  Created by 张耀 on 2020/5/26.
//  Copyright © 2020 张耀. All rights reserved.
//

import UIKit

class MyStack: NSObject {

    var array:[Int]     //记录全部栈元素
    var arrayMin:[Int]  //记录最近元素到栈
    var topInde:Int     //最顶部的元素
    
    /** initialize your data structure here. */
    override init() {
           array = [Int]()
        arrayMin = [Int]()
            topInde = 0
       }
       
       func push(_ x: Int) {
        array.append(x)
        topInde = x
        if arrayMin.isEmpty {
            arrayMin.append(x)
        }
        else if x <= arrayMin.last!
        {
            arrayMin.append(x)
        }
       }
       
       func pop() {
        array.removeLast()
        if topInde == arrayMin.last! {
            arrayMin.removeLast()
        }
        topInde = array.last!
       }
       
       func top() -> Int {
        return topInde
       }
       
       func getMin() -> Int {
        return arrayMin.last!
       }
}

class MyStack2:NSObject {
    
    var queue = MyQuqu()
    var temQueue = MyQuqu()
     

    /** Initialize your data structure here. */
    override init() {

    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {

        queue.push(x: x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        var remove = -1
                while !queue.isEmpty() {
                    let first = queue.pop()
                    remove = first
                    if queue.isEmpty() {
                        continue
                    }
                    temQueue.push(x: first)
                }
                while !temQueue.isEmpty() {
                    let first = temQueue.pop()
                    queue.push(x: first)
                }
                return remove
    }
    
    /** Get the top element. */
    func top() -> Int {
        var remove = -1
                while !queue.isEmpty() {
                    let first = queue.pop()
                    temQueue.push(x: first)
                    remove = first
                }
                while !temQueue.isEmpty() {
                    let first = temQueue.pop()
                    queue.push(x: first)
                }
                return remove

    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue.isEmpty()
    }
}

class MyQuqu:NSObject {
    
    var array = [Int]()
    
    func push(x:Int) {
        array.append(x)
    }
    
    func pop() -> Int {
        return array.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    func size() -> Int {
        return array.count
    }
}
