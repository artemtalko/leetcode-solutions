//
//  14. Longest Common Prefix.swift
//  leetcode
//
//  Created by Artem on 29.10.2025.
//

/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".



 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.


 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters if it is non-empty.
 */


class Solution14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let baseStr = strs[0]
        var prefix = ""

        for i in 0..<baseStr.count {
            let currentChar = baseStr[baseStr.index(baseStr.startIndex, offsetBy: i)]

            for word in strs.dropFirst() {
                if i >= word.count || word[word.index(word.startIndex, offsetBy: i)] != currentChar {
                    return prefix
                }
            }

            prefix.append(currentChar)
        }

        return String(prefix)
    }
}
