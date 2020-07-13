//
//  CloudFunction.swift
//  TesLeeCode
//
//  Created by 张耀 on 2020/7/1.
//  Copyright © 2020 张耀. All rights reserved.
//

import UIKit

class CloudFunction: NSObject {
    
    static let sharedInstance = CloudFunction()
    
    //数组中出现次数超过一半的数字
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var const = 0
        var card = 0
        for i in nums {
            if const == 0 {
                card = i
            }
            const += card == i ? 1 : -1
        }
        return card
    }
    
    //第一个只出现一次的字符
    func firstUniqChar(_ s: String) -> Character {

    }
    
    // 1～n整数中1出现的次数
    func countDigitOne(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        
        var a = 1
        var c = 0
        var b = 0
        
        while a < n {
            a =  a * 10
            c =
            for i in 2...n {
                if  i / a == 1 || i % a == 1 {
                    b += 1
                }
            }
        }
        return b + 1
    }
}
