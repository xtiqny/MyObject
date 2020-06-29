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
        
        var test5 = [Solution.init().reverse(-123)]
        
        //011111111000000翻转
        var test6 = [Solution.init().reverseBits(12345)]
        
        var arr = [1,1,2]
        
        var test7 = [Solution.init().removeDuplicates(&arr)]
        
        var test8 = [Solution.init().nextGreaterElement([1,3,5,2,4],[6,5,4,3,2,1,7])]
        
        var queue = MyQueue.init();

           queue.push(1);
           queue.push(2);
           queue.peek();  // 返回 1
           queue.pop();   // 返回 1
           queue.empty(); // 返回 false
        
        
        
        ////找K的最小数z数字
        var test9 = [Solution.init().getLeastNumbers([3,2,1], 2)]
        
        //数组中重复的数字
        var test10 = [Solution.init().findRepeatNumber([2, 3, 1, 0, 2, 5, 3])]
        
         //二维数组中的查找
        var test11 = [Solution.init().findNumberIn2DArray([
          [1,   4,  7, 11, 15],
          [2,   5,  8, 12, 19],
          [3,   6,  9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30]
        ], 5)]
        
        //替换空格
        var test12 = [Solution.init().replaceSpace("We are happy.")]
        
        
        let temp1 = ListNode(1)
        let temp3 = ListNode(3)
        let temp2 = ListNode(2)
        temp1.next = temp3
        temp3.next = temp2
        
        var test13 = [Solution.init().reversePrint(temp1)]
        
        //顺时针打印矩阵
        var test14 = [Solution.init().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])]
        
        var test15 = [Solution.init().minCount([2,3,10])]
        
        var test16 = [Solution.init().exchange([1,3,5])]

    }
    
    


}

