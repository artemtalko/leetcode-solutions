//
//  15. 3Sum.swift
//  leetcode
//
//  Created by Artem on 12.11.2025.
//


/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.



 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 Example 2:

 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 Example 3:

 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.
 */

class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let nums = nums.sorted()

        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] { continue }

            var left = i + 1
            var right = nums.count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]

                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])

                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }

                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return result
    }
}


//        for num in nums {
//            let firstElem = num
//            for num in nums.filter( { $0 != firstElem || $0 == 0 } ) {
//                let secoundElem = num
//                for num in nums.filter({ $0 != secoundElem || $0 == 0 }) {
//                    let thirdElem = num
//                    if firstElem + secoundElem + thirdElem == 0 &&
//                        !result.contains([firstElem, secoundElem, thirdElem]) {
//                        result.append([firstElem, secoundElem, thirdElem].sorted())
//                    }
//                }
//            }
//        }
//
