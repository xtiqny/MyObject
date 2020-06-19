//
//  Solution.swift
//  TesLeeCode
//
//  Created by 张耀 on 2020/5/25.
//  Copyright © 2020 张耀. All rights reserved.
//

import UIKit


class Solution: NSObject {

//完全平方数是几
    func numSquares(_ n:Int) -> Int
    {
        var i = n
        while i % 4 == 0{
            i /= 4
        }
        
        if i % 8 == 7 {
            return 4
        }
        

        var a = 0
         while a * a <= n {
             let b = Int(sqrt(Double(n - a * a)))
             if a * a + b * b == n {
                 let ca =  a == 0 ? 0 : 1
                 let cb = b == 0 ? 0 : 1
                 return ca + cb
             }
             a += 1
         }
        return a
    }
    
    
    //是否是完全平方数
    func isPerfectSquare(_ unm:Int) -> Bool {
        if unm <= 0 {
            return false
        }
        
        if unm == 1 {
            return true
        }
        
        var i = 1
        
        while i >= 1 {
            if i*i == unm {
                i = 0
            }
            else if  i*i > unm
            {
                return false
            }
            else
            {
                i += 1
            }
        }
        return true
    }
    
    
    // 有效的括号
    func effectiveBracket(str:String) -> Bool
    {
        if str.count == 0 {
                return true
            }
            var arr: [Character] = []
            for a in str {
                if a == ")" {
                    if arr.popLast() != "(" {
                        return false
                    }
                }else if a == "]" {
                    if arr.popLast() != "[" {
                        return false
                    }
                }else if a == "}" {
                    if arr.popLast() != "{" {
                        return false
                    }
                }else{
                    arr.append(a)
                }
            }
            return arr.count == 0
    }
    
    
    
    func isValid(str:String) -> Bool {
        if str.count <= 0
        {
            return true;
        }
        
        var strArray = [Character]()
        
        for s in str {
            switch s {
            case "(","{","[":
                strArray.append(s)
            case ")":
                guard (!strArray.isEmpty && strArray.removeLast() == "(" ) else {
                    return false
                }
            case "}":
                guard (!strArray.isEmpty && strArray.removeLast() == "{" ) else {
                    return false
                }
            case "]":
                guard (!strArray.isEmpty && strArray.removeLast() == "[" ) else {
                    return false
                }
            default:
                break;
            }
        }
        return strArray.isEmpty;
    }


    //逆波兰表达式求值
    func evalRPN(_ tokens: [String]) -> Int {

        if tokens.count <= 0
        {
            return -1;
        }
        
        
        var intArray = [Int]()
        for str in tokens
        {
            switch str {
            case "+":
                guard let a = intArray.popLast(), let b = intArray.popLast() else {return -1}
                    intArray.append(a+b)
            break;
            case "-":
                guard let a = intArray.popLast(), let b = intArray.popLast() else {return -1}
                intArray.append(b-a)
            case "*":
                guard let a = intArray.popLast(), let b = intArray.popLast() else {return -1}
                intArray.append(b*a)
            case "/":
                guard let a = intArray.popLast(), let b = intArray.popLast() else {return -1}
                intArray.append(b/a)
            default:
                guard let n = Int(str) else{return -1}
                 intArray.append(n)
            }
            
        }
        return intArray.last!
    }
    
    
    //每日温度
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        
         var result = [Int](repeating: 0, count: T.count)
         var stack = [Int]()
         stack.append(0)
          for i in 1..<T.count {
              while let last = stack.last, T[last] < T[i] {
                  stack.removeLast()
                  result[last] = i - last
             }
             stack.append(i)
         }
         return result
        
        }
    
    //目标和 DFS
//    输入: nums: [1, 1, 1, 1, 1], S: 3
//    输出: 5
//    解释:
//
//    -1+1+1+1+1 = 3
//    +1-1+1+1+1 = 3
//    +1+1-1+1+1 = 3
//    +1+1+1-1+1 = 3
//    +1+1+1+1-1 = 3
//
//    一共有5种方法让最终目标和为3。
    
    var result = 0
    
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
            findValue(nums: nums, S: S, cur: 0, res: 0)
            return result;
       }
    
    func findValue(nums:[Int],S:Int,cur:Int,res:Int) {
        
        if cur == nums.count {
            if res == S {
                result += 1
            }
        }
        else
        {
            findValue(nums: nums, S: S , cur: cur + 1, res: res + nums[cur])
            NSLog("one%d", res)
            findValue(nums: nums, S: S , cur: cur + 1, res: res - nums[cur])
            NSLog("two%d", res)
        }
    }
    //目标和 2
    
    func subsetsum(nums:[Int],S:Int) -> Int {
        NSLog("%d", S)
        var dp:[Int] = [Int](repeating:0,count:S + 1)
         dp[0] = 1
         for n in nums
         {
             if n <= S
             {
                 for i in (n...S).reversed()
                 {
                     dp[i] += dp[i - n]

                 }
             }

         }
         return dp[S]
    }
    
    func findTargetSumWays2(_ nums:[Int],_ S:Int) -> Int {
        var sum:Int = 0
        for i in nums{
            sum += i
        }
        return sum < S || (S + sum) % 2 > 0 ? 0 : subsetsum(nums: nums, S: (S + sum) >> 1)
    }
    
    
    //整数反转
func reverse(value:Int) -> Int {
    var i = value;
    var a = 0
    while i != 0 {
        let j = i%10
        i = i/10
        a = a * 10 + j
    }
    
    if a > Int32.max || a < Int32.min {
        return 0 ;
    }
    return a
}
    
    func reverse(_ x: Int) -> Int {
        var i = x
        var a = 0
        
        while i != 0 {
            let j = i % 10
            i = i / 10
            a = a * 10 + j
        }
        
        if a > Int32.max || a < Int32.min {
            return 0
        }
        return a
    }
    
    //两数之和
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count < 0 {
        return [0]
    }
    
    if target <= 0 {
        return [0]
    }
    
    var array:[Int] = []
    
    for i in 0..<nums.count {
        
        let a = nums[i]
        for j in i+1..<nums.count {
            if a + nums[j] == target {
                array.append(i)
                array.append(j)
                return array;
            }
        }
    }
    return []
}
    
    

    
    func reverseBits(_ n: Int) -> Int {
        var res = n
        
        var i = 0
        for j in 0..<32 {
            i = (i << 1) + (res&1)
            res = res >> 1
        }
        return i
    }
    
    //去除数组中重复的数字
    func removeDuplicates(_ nums:inout[Int]) -> Int {
        if nums.count < 0 {
            return 0
        }
        
        var start = 0
        for i in start+1..<nums.count {
            if nums[i] != nums[start]
            {
                start += 1
                nums[start] = nums[i]
            }
        }
        return start + 1
    }
    
    
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        if nums1.count <= 0 ||  nums2.count <= 0{
            return []
        }
        
        var arr = [Int]()
        for (_,i) in nums1.enumerated() {
            let a = nums2.firstIndex(of: i)!
            if a ==  nums2.count - 1{ //当1下标 == 第二个数组最大长度直接是-1，它右边没值了
                arr.append(-1)
            }
            else
            {
                var b = false
                for j in (a + 1)..<nums2.count {
                    if nums2[j] > i {//遍历比较该值右边的全部数据是否比他大
                        arr.append(nums2[j])
                        b = true
                        break
                    }
                }
                
                if !b {
                    arr.append(-1)
                }
            }
        }
        
        return arr
    }
    
   
    
}
