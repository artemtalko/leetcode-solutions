//
//  1. Two sum.swift
//  leetcode
//
//  Created by Artem on 24.11.2025.
//

/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.



 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]

 */


class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var checked: [Int : Int] = [:]

        for i in 0 ..< nums.count {
            let current = nums[i]
            let needed = target - current

            if let index = checked[needed] {
                return [index, i]
            }

            checked[current] = i
        }

        return []
    }
}
