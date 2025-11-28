//
//  49. Group Anagrams.swift
//  leetcode
//
//  Created by Artem on 28.11.2025.
//

/*
 49. Group Anagrams
 Medium

 Topics
 premium lock icon
 Companies
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.



 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]

 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:

 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 Example 2:

 Input: strs = [""]

 Output: [[""]]

 Example 3:

 Input: strs = ["a"]

 Output: [["a"]]
 */

class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()

        for str in strs {
            let key = String(str.sorted())
            dict[key, default: []].append(str)
        }

        return Array(dict.values)
    }
}

/*
 MARK: my first solution
 func groupAnagrams(_ strs: [String]) -> [[String]] {
     guard !strs.isEmpty else {
         return [[]]
     }

     if strs.count == 1, let oneStr = strs.first {
         return [[oneStr]]
     }

     var checked: [String: [String]] = [:]

     strs.forEach { str in
         let key = getKey(str: str)
         checked[key, default: []].append(str)
     }

     return Array(checked.values)
 }

 func getKey(str: String) -> String {
     var freq = Array(repeating: 0, count: 26)

     guard let startAsciiValue = Character("a").asciiValue else { return "" }

     str.forEach { char in
         let ascii = char.asciiValue!
         let index = Int(ascii - startAsciiValue)
         freq[index] += 1
     }

     return String(describing: freq)
 }
 */
