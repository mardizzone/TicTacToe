//
//  TurnManager.swift
//  TicTacToe
//
//  Created by Michael Ardizzone on 5/31/18.
//  Copyright © 2018 Michael Ardizzone. All rights reserved.
//

import Foundation

class TurnManager {
    
    var playerTurn = PlayerTurn.PlayerOne
    var movesArray = Array<String>(repeating: "", count: 9)
    
    static let shared = TurnManager()
    
    func playerDidMove() {
        //toggle Player Turn
        if playerTurn == PlayerTurn.PlayerOne {
            playerTurn = PlayerTurn.PlayerTwo
        } else {
            playerTurn = PlayerTurn.PlayerOne
        }
    }
    
    func anyPlayerMoves(squareNumber: Int) {
        if playerTurn == PlayerTurn.PlayerOne {
            movesArray[squareNumber] = "X"
        } else {
            movesArray[squareNumber] = "O"
        }
    }
    
    func resetMovesArray() {
        movesArray = Array<String>(repeating: "", count: 9)
    }

    
    func didPlayerOneWin() -> Bool {
        if movesArray[0] == "X" && movesArray[1] == "X" && movesArray[2] == "X" {
            return true
        }
        else if movesArray[3] == "X" && movesArray[4] == "X" && movesArray[5] == "X" {
            return true
        }
        else if movesArray[3] == "X" && movesArray[4] == "X" && movesArray[5] == "X" {
            return true
        }
        else if movesArray[6] == "X" && movesArray[7] == "X" && movesArray[8] == "X" {
            return true
        }
        else if movesArray[0] == "X" && movesArray[3] == "X" && movesArray[6] == "X" {
            return true
        }
        else if movesArray[1] == "X" && movesArray[4] == "X" && movesArray[7] == "X" {
            return true
        }
        else if movesArray[2] == "X" && movesArray[5] == "X" && movesArray[8] == "X" {
            return true
        }
        else if movesArray[0] == "X" && movesArray[4] == "X" && movesArray[8] == "X" {
            return true
        }
        else if movesArray[2] == "X" && movesArray[4] == "X" && movesArray[6] == "X" {
            return true
        }
        else {
            return false
        }
    }
    
    func didPlayerTwoWin() -> Bool {
        if movesArray[0] == "O" && movesArray[1] == "O" && movesArray[2] == "O" {
            return true
        }
        else if movesArray[3] == "O" && movesArray[4] == "O" && movesArray[5] == "O" {
            return true
        }
        else if movesArray[3] == "O" && movesArray[4] == "O" && movesArray[5] == "O" {
            return true
        }
        else if movesArray[6] == "O" && movesArray[7] == "O" && movesArray[8] == "O" {
            return true
        }
        else if movesArray[0] == "O" && movesArray[3] == "O" && movesArray[6] == "O" {
            return true
        }
        else if movesArray[1] == "O" && movesArray[4] == "O" && movesArray[7] == "O" {
            return true
        }
        else if movesArray[2] == "O" && movesArray[5] == "O" && movesArray[8] == "O" {
            return true
        }
        else if movesArray[0] == "O" && movesArray[4] == "O" && movesArray[8] == "O" {
            return true
        }
        else if movesArray[2] == "O" && movesArray[4] == "O" && movesArray[6] == "O" {
            return true
        }
        else {
            return false
        }
    }
    
    func didStalemate() -> Bool {
        for move in movesArray {
            if move == "" {
                return false
            }
        }
        return true
    }
    
}
