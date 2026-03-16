//
//  Encode and Decode Strings.swift
//  leetcode
//
//  Created by Artem on 13.03.2026.
//

/*
 Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

 Machine 1 (sender) has the function:

 string encode(vector<string> strs) {
     // ... your code
     return encoded_string;
 }
 Machine 2 (receiver) has the function:

 vector<string> decode(string s) {
     //... your code
     return strs;
 }
 So Machine 1 does:

 string encoded_string = encode(strs);
 and Machine 2 does:

 vector<string> strs2 = decode(encoded_string);
 strs2 in Machine 2 should be the same as strs in Machine 1.

 Implement the encode and decode methods.

 Example 1:

 Input: dummy_input = ["Hello","World"]

 Output: ["Hello","World"]

 Explanation:
 Machine 1:
 Codec encoder = new Codec();
 String msg = encoder.encode(strs);
 Machine 1 ---msg---> Machine 2

 Machine 2:
 Codec decoder = new Codec();
 String[] strs = decoder.decode(msg);
 Example 2:

 Input: dummy_input = [""]

 Output: [""]

 Constraints:

 0 <= strs.length < 100
 0 <= strs[i].length < 200
 strs[i] contains any possible characters out of 256 valid ASCII characters.

 Follow up: Could you write a generalized algorithm to work on any possible set of characters?

 */

import Foundation

class SolutionNeet2 {
    func encode(_ strs: [String]) -> String {
        var res: String = ""

        for str in strs {
            res.append("\(str.count)#\(str)")
        }

        return res
    }

    func decode(_ str: String) -> [String] {
        // "12#mymymymymymy4#name2#is5#Artem"
        let chars = Array(str)
        var i = 0

        var numStr: String = ""
        var res: [String] = []

        while i < chars.count {
            // num = "12"
            if chars[i].isNumber {
                numStr.append(chars[i])
                i += 1
            } else if chars[i] == "#" {
                let length = Int(numStr)!

                let startIndex = i + 1
                let endIndex = startIndex + length

                let word = String(chars[startIndex..<endIndex])
                res.append(word)

                i = endIndex

                numStr = ""
            }
        }

        return res
    }
}

