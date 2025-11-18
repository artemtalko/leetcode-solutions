//
//  20. Valid Parentheses.swift
//  leetcode
//
//  Created by Artem on 31.10.2025.
//

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.


 Example 1:

 Input: s = "()"

 Output: true

 Example 2:

 Input: s = "()[]{}"

 Output: true

 Example 3:

 Input: s = "(]"

 Output: false

 Example 4:

 Input: s = "([])"

 Output: true

 Example 5:

 Input: s = "([)]"

 Output: false



 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

class Solution20 {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        let pairs: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]

        for char in s {
            if pairs.values.contains(char) {
                stack.append(char)
            } else if let expected = pairs[char] {
                guard stack.last == expected else { return false }
                stack.removeLast()
            }
        }

        return stack.isEmpty
    }
}
