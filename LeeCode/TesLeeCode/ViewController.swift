//
//  ViewController.swift
//  TesLeeCode
//
//  Created by 张耀 on 2020/5/25.
//  Copyright © 2020 张耀. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var obj = MyStack.init()
        obj.push(1)
        obj.push(2)
        obj.push(3)
        
        obj.pop()
        
        var i = obj.top()
        var a = obj.getMin()
        
        
        var ba = Solution.init().effectiveBracket(str: "()")
        var bc = Solution.init().isValid(str: "({})")
        
        
        let cc = Solution.init().evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])
        
        var test = Solution.init().dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])
        
        var test2 = [Solution.init().findTargetSumWays([1, 1, 1, 1, 1], 3)]
        
        var test3 = [Solution.init().findTargetSumWays2( [1, 1, 1, 1, 1], 3)]
        
        var test4 = [Solution.init().twoSum([2,5,5,11]
        , 10)]
        
    }


}

