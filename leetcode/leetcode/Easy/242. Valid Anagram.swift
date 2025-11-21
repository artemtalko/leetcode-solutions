//
//  242. Valid Anagram.swift
//  leetcode
//
//  Created by Artem on 21.11.2025.
//

import SwiftUI

class Solution242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }

        let arrS = Array(s)
        let arrT = Array(t)

        var count: [Character: Int] = [:]

        for i in 0..<arrS.count {
            count[arrS[i], default: 0] += 1
            count[arrT[i], default: 0] -= 1
        }

        for (_, value) in count {
            if value != 0 {
                return false
            }
        }

        return true
    }
}


/*
 MARK: not optimized first solution
 func isAnagram(_ s: String, _ t: String) -> Bool {
         guard s.count == t.count else {
             return false
         }

         guard Array(s).sorted() == Array(t).sorted() else {
             return false
         }

         return true
     }
 */
