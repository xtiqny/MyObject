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


