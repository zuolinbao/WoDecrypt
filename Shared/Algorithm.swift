//
//  Algorithm.swift
//  WoDecrypt
//
//  Created by zuo on 2021/1/12.
//

import Foundation
class TreeNode {
    let val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
}

func isValidBST(root: TreeNode) -> Bool{
    return isValidBST(root: root, min: nil, max: nil)
}

func isValidBST(root: TreeNode?,min: TreeNode?,max: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    if let min = min {
        if root.val < min.val {
            return false
        }
    }
    if let max = max {
        if root.val > max.val {
            return false
        }
    }
    return isValidBST(root: root.left, min: min, max: root) && isValidBST(root: root.right, min: root, max: max)
    
    
}

func coinChange(coins: [Int], amount: Int) -> Int {
    var dp = [Int](repeating: amount+1, count: amount+1)
    dp[0] = 0
    let coins = [1,3,5]
    for (i,_) in dp.enumerated() {
        for coin in coins {
            if i - coin < 0 {
                continue
            }
            dp[i] = min(dp[i], 1+dp[i-coin])
        }
        
    }
    return (dp[amount] == amount+1) ? -1 : dp[amount]
}

class ListNode {
    let val: Int
    var next: ListNode?
    init(val: Int) {
        self.val = val
    }
}

func reverse(head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    guard head.next != nil else {
        return head
    }
    let lastNode = reverse(head: head.next)
    head.next?.next = head
    head.next = nil
    return lastNode
}


var lastNode: ListNode? = nil
func reverse(head: ListNode?,i: Int) -> ListNode? {
    guard let head = head else {
        return nil
    }
    guard  i == 1 else {
        lastNode = head.next
        return head
    }
    let lastNode = reverse(head: head.next,i: i-1)
    head.next?.next = head
    head.next = lastNode
    return lastNode
}

func reverseBetween(head: ListNode?, m: Int, n: Int) -> ListNode? {
    guard let head = head else {
        return nil
    }
    guard  m == 1 else {
        return reverse(head: head, i: n)
    }
    head.next = reverseBetween(head: head.next, m: m-1, n: n-1)
    return lastNode
}

func abaString(s: String) -> String {
    var l = s.count/2
    var r = s.count/2
    if s.count%2 == 0 {
        r = s.count/2
        l = r-1
    } else {
        r = (s.count+1)/2
        l = r-1
    }
    while l>0 && r<s.count-1 && charOf(s: s, i: l)==charOf(s: s, i: r){
        l-=1
        r+=1
    }
    let cs = s[s.index(s.startIndex, offsetBy: l)...s.index(s.startIndex, offsetBy: r)]
    return String.init(cs)
}

func charOf(s: String, i: Int) -> Character {
    let c = s[s.index(s.startIndex, offsetBy: i)]
    return c
}

func stringOf(s: String, l: Int, r: Int) -> String {
    let cs = s[s.index(s.startIndex, offsetBy: l)...s.index(s.startIndex, offsetBy: r)]
    return String.init(cs)
}

func aaString(s: String, l: Int, r: Int) -> String {
    var l = l
    var r = r
    while l >= 0 && r < s.count && charOf(s: s, i: l) == charOf(s: s, i: r) {
        l -= 1
        r += 1
    }
    return stringOf(s: s, l: l, r: r)
}

var left: ListNode?

func isPalindrome(head: ListNode?) -> Bool {
    left = head;
    return traverse(right: head);
}

func traverse(right: ListNode?) -> Bool {
    guard right != nil else {
        return true
    }
    var res = traverse(right: right?.next)
    res = res && (right?.val == left?.val)
    left = left?.next;
    return res;
}


func getLeastCap(weights: [Int],days: Int) -> Int {
    var left = 1
    var right = weights.reduce(0) { (sum, weight) -> Int in
        sum + weight
    }
    while left < right {
        let mid = left + (right - left)/2
        if canCarry(weights: weights, days: days,cap: mid) {
            right = mid
        } else {
            left = mid
        }
    }
    return left
}

func canCarry(weights: [Int],days: Int,cap: Int) -> Bool {
    var leastDays = 1
    var currentCap = cap
    for weight in weights {
        currentCap -= weight
        if currentCap < 0 {
            leastDays += 1
        }
    }
    return true
}






