//
//  ViewController.swift
//  TicTacToe
//
//  Created by Michael Ardizzone on 5/31/18.
//  Copyright © 2018 Michael Ardizzone. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {

    @IBOutlet weak var playerOneUnderscore: UIView!
    @IBOutlet weak var playerTwoUnderscore: UIView!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    var allButtons : [UIButton]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allButtons = [button0, button1, button2, button3, button4, button5, button6, button7, button8]
    }
    
    @IBAction func playAgainTapped(_ sender: UIButton) {
        resetAllButtons()
        TurnManager.shared.resetMovesArray()
        TurnManager.shared.playerTurn = PlayerTurn.PlayerOne
        playAgainButton.isHidden = true
        winnerLabel.isHidden = true
        illustrateTurnChange()
    }
    
    @IBAction func anySquarePressed(_ sender: UIButton) {
        TurnManager.shared.anyPlayerMoves(squareNumber: sender.tag)
        paintXorO(button: sender)
        TurnManager.shared.playerDidMove()
        illustrateTurnChange()
        
        if TurnManager.shared.didPlayerOneWin() {
            showWinnerPlayerOneLabel()
            disableAllButtons()
        }
        if TurnManager.shared.didPlayerTwoWin() {
            showWinnerPlayerTwoLabel()
            disableAllButtons()
        }
        if TurnManager.shared.didStalemate() {
            showStalemateLabel()
        }
    }
    
}

//MARK: - Helper Functions
extension TicTacToeViewController {
    
    func paintXorO(button: UIButton) {
        if TurnManager.shared.playerTurn == PlayerTurn.PlayerOne {
            button.setImage(#imageLiteral(resourceName: "icons8-x-52"), for: UIControlState.normal)
            button.setImage(#imageLiteral(resourceName: "icons8-x-52"), for: UIControlState.disabled)
            button.isEnabled = false
        } else {
            button.setImage(#imageLiteral(resourceName: "icons8-o-52"), for: UIControlState.normal)
            button.setImage(#imageLiteral(resourceName: "icons8-o-52"), for: UIControlState.disabled)
            button.isEnabled = false
        }
    }
    
    func illustrateTurnChange() {
        if TurnManager.shared.playerTurn == PlayerTurn.PlayerOne {
            playerOneUnderscore.isHidden = false
            playerTwoUnderscore.isHidden = true
        } else {
            playerOneUnderscore.isHidden = true
            playerTwoUnderscore.isHidden = false
        }
    }
    
    func showWinnerPlayerOneLabel() {
        winnerLabel.text = "Player 1 Wins"
        winnerLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    func showStalemateLabel() {
        winnerLabel.text = "Stalemate"
        winnerLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    func showWinnerPlayerTwoLabel() {
        winnerLabel.isHidden = false
        winnerLabel.text = "Player 2 Wins"
        playAgainButton.isHidden = false
    }
    
    func disableAllButtons() {
        guard let buttons = allButtons else { return }
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    func resetAllButtons() {
        guard let buttons = allButtons else { return }
        for button in buttons {
            button.isEnabled = true
            button.setImage(nil, for: UIControlState.normal)
            button.setImage(nil, for: UIControlState.disabled)
        }
    }
}
