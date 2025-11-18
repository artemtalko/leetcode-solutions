//
//  3. Longest Substring Without Repeating Characters.swift
//  leetcode
//
//  Created by Artem on 14.11.2025.
//


/*
 Given a string s, find the length of the longest substring without duplicate characters.



 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */


class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var seen: Set<Character> = []
        var left = s.startIndex
        var maxLength = 0

        for right in s.indices {

            while seen.contains(s[right]) {
                seen.remove(s[left])
                left = s.index(after: left)
            }

            seen.insert(s[right])

            let length = s.distance(from: left, to: s.index(after: right))
            maxLength = max(maxLength, length)
        }

        return maxLength
    }
}
