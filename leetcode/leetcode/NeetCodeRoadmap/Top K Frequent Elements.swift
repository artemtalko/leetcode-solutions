//
//  Top K Frequent Elements.swift
//  leetcode
//
//  Created by Artem on 12.03.2026.
//

import SwiftUI

class SolutionNeet1 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counts = [Int: Int]()

        for num in nums {
            counts[num, default: 0] += 1
        }

        let sorted = counts.sorted { leading, trailing in
            leading.value > trailing.value
        }

        let firstElems = sorted.prefix(k).map({ $0.key })

        return firstElems
    }
}
