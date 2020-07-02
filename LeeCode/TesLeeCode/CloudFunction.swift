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
        
//        if nums.count == 1
//        {
//            return nums.first!
//        }
//
//        let b = nums.count / 2
//        for  i in 0..<nums.count {
//            var a = 0
//            for j in i + 1..<nums.count {
//                if nums[i] == nums[j] {
//                    a += 1
//                }
//
//                if a >= b {
//                    return nums[i]
//                }
//            }
//        }
//        return 0
    }
}
