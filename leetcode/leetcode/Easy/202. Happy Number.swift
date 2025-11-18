//
//  202. Happy Number.swift
//  leetcode
//
//  Created by Artem on 03.11.2025.
//

/*
 Write an algorithm to determine if a number n is happy.

 A happy number is a number defined by the following process:

 Starting with any positive integer, replace the number by the sum of the squares of its digits.
 Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
 Those numbers for which this process ends in 1 are happy.
 Return true if n is a happy number, and false if not.



 Example 1:

 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 Example 2:

 Input: n = 2
 Output: false

 */

import Foundation

class Solution202 {
    func isHappy(_ n: Int) -> Bool {
        var newValue = n
        var history: Set<Int> = []

        while newValue != 1 {
            guard !history.contains(newValue) else { return false }

            history.insert(newValue)

            var sum = 0
            var temp = newValue

            while temp > 0 {
                let digit = temp % 10
                sum += digit * digit
                temp /= 10
            }

            newValue = sum
        }

        return true
    }
}
