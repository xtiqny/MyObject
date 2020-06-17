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
