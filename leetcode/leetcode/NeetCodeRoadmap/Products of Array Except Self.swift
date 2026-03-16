//
//  Products of Array Except Self.swift
//  leetcode
//
//  Created by Artem on 14.03.2026.
//

/*
 Given an integer array nums, return an array output where output[i] is the product of all the elements of nums except nums[i].

 Each product is guaranteed to fit in a 32-bit integer.

 Follow-up: Could you solve it in O(n) time without using the division operation?
 */

import Foundation

class SolutionNeet3 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var left = Array(repeating: 1, count: nums.count)
        var right = Array(repeating: 1, count: nums.count)
        var result = Array(repeating: 1, count: nums.count)

        var current = 1

        for i in 0..<nums.count {
            left[i] = current
            current = current * nums[i]
        }

        current = 1

        for i in (0..<nums.count).reversed() {
            right[i] = current
            current = current * nums[i]
        }

        for i in 0..<nums.count {
            result[i] = left[i] * right[i]
        }

        return result
    }
}

