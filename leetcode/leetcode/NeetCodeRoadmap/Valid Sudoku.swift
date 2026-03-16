//
//  Valid Sudoku.swift
//  leetcode
//
//  Created by Artem on 15.03.2026.
//

import Foundation

/*
 You are given a 9 x 9 Sudoku board board. A Sudoku board is valid if the following rules are followed:

 Each row must contain the digits 1-9 without duplicates.
 Each column must contain the digits 1-9 without duplicates.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without duplicates.
 Return true if the Sudoku board is valid, otherwise return false

 Note: A board does not need to be full or be solvable to be valid.
 */

class SolutionNeet4 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        /*
         Input: board =
         [
             ["1","2",".",".","3",".",".",".","."],
             ["4",".",".","5",".",".",".",".","."],
             [".","9","8",".",".",".",".",".","3"],
             ["5",".",".",".","6",".",".",".","4"],
             [".",".",".","8",".","3",".",".","5"],
             ["7",".",".",".","2",".",".",".","6"],
             [".",".",".",".",".",".","2",".","."],
             [".",".",".","4","1","9",".",".","8"],
             [".",".",".",".","8",".",".","7","9"]
         ]

         Output: true
         */


        /*
           1 2 3 | 4 5 6 | 7 8 9
           2 3 4 | 5 6 7 | 8 9 1
           3 4 5 | 6 7 8 | 9 1 2
           - - - - - - - - - - -
           4 5 6 | 7 8 9 | 1 2 3
           5 6 7 | 8 9 1 | 2 3 3
           6 7 8 | 9 1 2 | 3 4 5
           - - - - - - - - - - -
           7 8 9 | 1 2 3 | 4 5 6
           8 9 1 | 2 3 4 | 5 6 7
           9 1 2 | 3 4 5 | 6 7 8
           - - - - - - - - - - -
         */

        var uniqueColumn = Array(repeating: Set<Character>(), count: 9)
        var uniqueRow = Array(repeating: Set<Character>(), count: 9)
        var uniqueSquare = Array(repeating: Set<Character>(), count: 9)

        for row in 0..<board.count {
            for col in 0..<board[row].count {
                let char = board[row][col]

                guard char != "." else { continue }

                /// when will check solution in future:
                /// if !uniqueRow[row].insert(char).inserted {
                ///     return false
                /// }

                if !uniqueColumn[col].contains(char) {
                    uniqueColumn[col].insert(char)
                } else {
                    return false
                }

                if !uniqueRow[row].contains(char) {
                    uniqueRow[row].insert(char)
                } else {
                    return false
                }

                let squareIndex = (row / 3) * 3 + (col / 3)

                if !uniqueSquare[squareIndex].contains(char) {
                    uniqueSquare[squareIndex].insert(char)
                } else {
                    return false
                }
            }
        }

        return true
    }
}
