//
//  283. Move Zeroes.swift
//  leetcode
//
//  Created by Artem on 30.10.2025.
//

/*
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.



 Example 1:

 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:

 Input: nums = [0]
 Output: [0]

 */

import Foundation

class Solution283 {
    func moveZeroes(_ nums: inout [Int]) {
        var lastNonZero = 0

        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, lastNonZero)
                lastNonZero += 1
            }
        }
    }


    func test() {
        var arr = [0,1,0,3,12]
        var zeros = 0

        moveZeroes(&arr)

        func moveZeroes(_ nums: inout [Int]) {
            for (index, num) in nums.enumerated() {
                if num == 0 {
                    nums.remove(at: index)
                    zeros += 1
                }
            }

            for _ in 0..<zeros {
                nums.append(0)
            }
        }
    }
}
