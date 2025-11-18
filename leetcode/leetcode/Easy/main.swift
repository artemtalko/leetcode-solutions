//
//  main.swift
//  leetcode
//
//  Created by Artem on 28.10.2025.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = prices[0]
        var maxProfit = 0

        for price in prices {
            if price < minPrice {
                minPrice = price
            } else {
                let profit = price - minPrice

                if profit > maxProfit {
                    maxProfit = profit
                }
            }
        }

        return maxProfit
    }
}

