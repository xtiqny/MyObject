//
//  Solution.swift
//  TesLeeCode
//
//  Created by 张耀 on 2020/5/25.
//  Copyright © 2020 张耀. All rights reserved.
//

import UIKit

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
     }
  }

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
    }
 }
 

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
    
    
    //两个列表 相当的下一个数若比他大 数组中c存该数 比他下 w存-1
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
    
    
    //模式匹配
    func patternMatching(_ pattern: String, _ value: String) -> Bool {

        if pattern.isEmpty || value.isEmpty {
            return true
        }
        
        var aBool = false
        var bBool = false
        
        
        if value.isEmpty {
            for s in pattern {
                if s == "a" {
                    aBool = true
                }
                
                if s == "b" {
                    bBool = true
                }
            }
            
            if aBool && bBool {
                return false
            }
        }
        
//        for c in value {
//            value.c
//        }
        
        return false
    }
    
    
    //找K的最小数z数字
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {

        if arr.count <= 0 || k == 0{
            return []
        }
        
        
        var array1 = arr
        var array = [Int]()
        
        for i in 0..<array1.count {
            for j in i+1..<array1.count {
                if array1[i] > array1[j]
                {
                    let tep = array1[i]
                    array1[i] = array1[j]
                    array1[j] = tep
                }
            }
        }
        
        for c in array1 {
            if array.count < k  {
                array.append(c)
            }
        }
        
        return array
    }
    
   
    //数组中重复的数字
    func findRepeatNumber(_ nums: [Int]) -> Int {
        if nums.count <= 0 {
            return 0;
        }
        
        var str:Set<Int> = []
        for i in nums {
            if !str.insert(i).inserted {
                return i
            }
        }
        return -1
    }
    
    //二维数组中的查找
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {

        if matrix.count <= 0 {
            return false
        }
        
        for curArray in matrix {
            
            for i in curArray
            {
                if i == target {
                    return true
                }
            }
        }
        return false
    }
    
    //二进制1的个数
    
    func hammingWeight(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        
        var i = 0
        var a = n
        
        while a != 0 {
            a = a & (a - 1)
            i += 1
        }
        return i
    }
    
    //替换空格
    func replaceSpace(_ s: String) -> String {

        if s.count <= 0 {
            return ""
        }
        
        var str = ""
        for ss in s {
            if ss == " " {
                str += "%20"
            }
            else{
                str += ss.description
            }
        }
        
        return str
    }
    
    
    //斐波那契数列
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        
        if n == 1{
            return 1
        }
        
        var i = 0
        var a = 1
        
        for _ in 2...n {
            let sum = (i + a) % 1000000007
            i = a
            a = sum
        }
        
        return a
    }
    
    //删除链表的节点
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        if head != nil &&  head?.val == val{
            return head?.next
        }
        
        var prev = head
        
        while prev?.next != nil {
            if prev?.next?.val == val {
                prev?.next = prev?.next?.next
            }
            else{
                prev = prev?.next
            }
        }
        return head
    }
    
    
    //链表反转
    func reverseList(_ head: ListNode?) -> ListNode? {

        var prev:ListNode? = nil
        var cur = head
        while cur != nil {
            let temp = cur?.next
            cur?.next = prev
            prev = cur
            cur = temp
        }
        return prev
       }
    
    //从尾到头打印链表
    func reversePrint(_ head: ListNode?) -> [Int] {

        var array = [Int]()
        var cur = head
        while cur != nil {
            array.append(cur!.val)
            cur = cur?.next
        }
        return array.reversed()
    }
    
    
    // 顺时针打印矩阵
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        guard matrix.count > 0 else {
            return []
        }

        var array = [Int]()
        
        var letf = 0
        var right = matrix.first!.count - 1
        var top = 0
        var bommt = matrix.count - 1
        
        while true {
            //从左到右变量  上
            for i in letf...right{
                array.append(matrix[top][i])
            }
            
            top+=1
            if top > bommt {
                break
            }
            
            //上到下  右
            for i in top...bommt {
                array.append(matrix[i][right])
                
                
            }
            
            right-=1
            if letf > right {
                break
            }
            
            //右到左 下
            for i in (letf...right).reversed() {
                array.append(matrix[bommt][i])
                
            }
            
            bommt-=1
            if top > bommt {
                break
            }
            
            //从下到上 左
            for i in (top...bommt).reversed() {
                array.append(matrix[i][letf])
            }
            
            letf += 1
            if letf > right {
                break
            }
        }
        
        
        return array
    }
    
    //拿硬币
    func minCount(_ coins: [Int]) -> Int {

        guard coins.count > 0 else {
            return 0
        }
        
        var const = 0
        for i in coins {
            if i <= 2 && i > 0 {
                const += 1
                continue
            }
            
            let temp = i/2
            let temp2 = i%2
            
            if temp2 != 0 {
                const += temp + 1
            }
            else{
               const += temp
            }
        }
        return const
    }
    
    
    func printNumbers(_ n: Int) -> [Int] {

        guard n > 0 else {
            return []
        }
        var max = 9
        var array = [Int]()
        for _ in 1..<n {
            max = max * 10 + 9
        }
        
        for i in 1...max {
            array.append(i)
        }
        
        return array
    }
    
    
    //调整数组顺序使奇数位于偶数前面
    func exchange(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return []
        }
        
        let array = nums
        var array1 = [Int]()
        var array2 = [Int]()
        for i in 0..<array.count {

            if array[i]%2 != 0 {
                array1.append(array[i])
            }else{
                array2.append(array[i])
            }
        }
        return array1 + array2
    }
    
    // 链表中倒数第k个节点
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {

        guard head != nil else {
            return nil
        }
        
        var tempHead = head
        var tempHead2 = head
        var curNode:ListNode? = nil
        var cont = 0

        while tempHead != nil {
            cont += 1
            tempHead = tempHead?.next
        }

        let i = cont - k > 0 ? cont - k : 1
        if i == 1 {
            return head
        }

        var j = 0
        while tempHead2 != nil  {
            j += 1
            if i == j {
                curNode = tempHead2?.next
                break
            }else{
                tempHead2 = tempHead2?.next
            }
        }
        return curNode
        
//        var slow = head
//                var fast = head
//                var k = k
//                while fast != nil {
//                    fast = fast?.next
//                    if k > 0 {
//                        k -= 1
//                    } else {
//                        slow = slow?.next
//                    }
//                }
//                return slow
    }
    
    //合并两个排序的链表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1
        var l2 = l2
        
        var l3:ListNode? = ListNode(0)
        var temp = l3
        
        
        while l1 != nil && l2 != nil {
            if l1!.val > l2!.val {
                temp?.next = l2
                l2 = l2?.next
            }else {
                temp?.next = l1
                l1 = l1?.next
            }
            temp = temp?.next
        }
        
        temp?.next = l1 != nil ? l1 : l2
        return l3?.next
    }
    
    
    //二叉树的镜像
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        
        
        guard root != nil else {
            return nil
        }
        
        return self.mirrorTree2(root)
    }
    
    func mirrorTree2(_ root: TreeNode?) -> TreeNode? {
        
        if let trre = root {
            let i:TreeNode? = trre.left
            trre.left = trre.right
            trre.right = i
            trre.left = self.mirrorTree2(trre.left)
            trre.right = self.mirrorTree2(trre.right)
            return trre
        }
        
        return nil
    }
    
}
