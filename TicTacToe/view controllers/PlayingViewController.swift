//
//  PlayingViewController.swift
//  TicTacToe
//
//  Created by Aiden Meeker on 9/29/21.
// i edited some info on here 

import UIKit

class PlayingViewController: UIViewController {

    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMidButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var midLeftButton: UIButton!
    @IBOutlet weak var midMidButton: UIButton!
    @IBOutlet weak var midRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomMidButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var turn: Int!
    var p1Score: Int!
    var p2Score: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        turn = 0
        p1Score = 0
        p2Score = 0
        turnLabel.text = "X is up first"
        player1ScoreLabel.text = "Player One Score: \(p1Score ?? -1)"
        player2ScoreLabel.text = "Player Two Score: \(p2Score ?? -1)"
        
        
    }
    
    @IBAction func topLeftPressed(_ sender: Any) {
        // whos turn it is
        // set the button's text to the person whose turn it was
        // make sure the button cannot be changed
        // see if there was a winner
        // see if there are any more moves
        let button = sender as! UIButton
        buttonPressed(button: button)
    }
    
    @IBAction func topMidPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    @IBAction func topRightPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    @IBAction func midLeftPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    @IBAction func midMidPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    @IBAction func midRightPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    @IBAction func bottomLeftPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    @IBAction func bottomMidPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    @IBAction func bottomRightPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        buttonPressed(button: button)
    }
    
    
    func buttonPressed(button: UIButton){
        
        if turn % 2 == 0 {
            // it is X
            print("X's turn")
            button.tag = 1
            button.setTitle("X", for: .normal)
            turnLabel.text = "O is up"
            
        } else {
            // it is O
            print("O's turn")
            button.tag = 2
            button.setTitle("O", for: .normal)
            turnLabel.text = "X is up"
        }
        button.isEnabled = false
        
        if checkForWinner() {
            
            //there is a winner
            //set all to disabled so no more moves
            let buttonArray = [topLeftButton,
                               topMidButton,
                               topRightButton,
                               midLeftButton,
                               midMidButton,
                               midRightButton,
                               bottomLeftButton,
                               bottomMidButton,
                               bottomRightButton
            ]
            
            for b in buttonArray {
                b?.isEnabled = false
            }
            //clear turn label
            turnLabel.isHidden = true
            //show reset button**
            if turn % 2 == 0 {
                //X won
                messageLabel.text = "X Won!"
                p1Score += 1
                player1ScoreLabel.text = "Player One Score: \(p1Score ?? -1)"
                
            } else {
                // O won
                messageLabel.text = "O Won!"
                updatePlayer2Score()
            }
            reset()
        } else if !anyMovesLeft() {
            // set it was a tie
            print("tie")
            reset()
            turnLabel.isHidden = true
            messageLabel.text = "Tie, No One Won (Y'all are bad or too good)."
        }
        
        turn += 1

    }
    
    func reset() {
        
    }
    
    func updatePlayer1Score() {
        p1Score += 1
        player1ScoreLabel.text = "Player One Score: \(p1Score ?? -1)"
    }
    
    func updatePlayer2Score() {
        p2Score += 1
        player2ScoreLabel.text = "Player Two Score: \(p2Score ?? -1)"
    }
    
    
    
    func anyMovesLeft() -> Bool {
        print("any moves called")
        let buttonArray = [topLeftButton,
                           topMidButton,
                           topRightButton,
                           midLeftButton,
                           midMidButton,
                           midRightButton,
                           bottomLeftButton,
                           bottomMidButton,
                           bottomRightButton
        ]
        
        var array = [Int]()
        for button in buttonArray {
            if button?.titleLabel?.text == "X" || button?.titleLabel?.text == "O" {
                // some way to chosen
                array.append(1)
            } else {
                
            }
        }
        
        print("array total = \(array.count)")
        if array.count == 8 {
            return false
        } else {
            return true
        }
    }
    
    func checkForWinner() -> Bool {
        print("checking for winner")
        
        if topLeftButton.tag == 1 && topMidButton.tag == 1 && topRightButton.tag == 1 {
            //x won the top row
            return true
        } else if topLeftButton.tag == 2 && topMidButton.tag == 2 && topRightButton.tag == 2 {
            //o won top row
            return true
        } else if (midLeftButton.tag == 1 && midMidButton.tag == 1 && midRightButton.tag == 1) || (midLeftButton.tag == 2 && midMidButton.tag == 2 && midRightButton.tag == 2) {
            // somoen won the mid row
            return true
        } else if (bottomLeftButton.tag == 1 && bottomMidButton.tag == 1 && bottomRightButton.tag == 1) || (bottomLeftButton.tag == 2 && bottomMidButton.tag == 2 && bottomRightButton.tag == 2) {
            //someone won the bottom row
            return true
        } else if (topLeftButton.tag == 1 && midLeftButton.tag == 1 && bottomLeftButton.tag == 1) || (topLeftButton.tag == 2 && midLeftButton.tag == 2 && bottomLeftButton.tag == 2){
            //left col won
            return true
        } else if (topMidButton.tag == 1 && midMidButton.tag == 1 && bottomMidButton.tag == 1 ) || (topMidButton.tag == 2 && midMidButton.tag == 2 && bottomMidButton.tag == 2 ){
            //mid col won
            return true
        } else if (topRightButton.tag == 1 && midRightButton.tag == 1 && bottomRightButton.tag == 1) || (topRightButton.tag == 2 && midRightButton.tag == 2 && bottomRightButton.tag == 2){
            //right col won
            return true
        } else if (topLeftButton.tag == 1 && midMidButton.tag  == 1 && bottomRightButton.tag == 1) || (topLeftButton.tag == 2 && midMidButton.tag  == 2 && bottomRightButton.tag == 2){
            //left to right dig won
            return true
        } else if (topRightButton.tag == 1 && midMidButton.tag == 1 && bottomLeftButton.tag == 1) || (topRightButton.tag == 2 && midMidButton.tag == 2 && bottomLeftButton.tag == 2){
            //right to left dig won
            return true
        }




        
        return false
    }
}


/*if (topLeftButton.tag == 1 && topMidButton.tag == 1 && topRightButton.tag == 1) || (topLeftButton.tag == 2 && topMidButton.tag == 2 && topRightButton.tag == 2) {
    return true
} else if (midLeftButton.tag == 1 && midMidButton.tag == 1 && midRightButton.tag == 1) || (midLeftButton.tag == 2 && midMidButton.tag == 2 && midRightButton.tag == 2) {
    return true
} else if (bottomLeftButton.tag == 1 && bottomMidButton.tag == 1 && bottomRightButton.tag == 1) || (bottomLeftButton.tag == 2 && bottomMidButton.tag == 2 && bottomRightButton.tag == 2) {
    return true
} else if (topLeftButton.tag == 1 && midLeftButton.tag == 1 && bottomLeftButton.tag == 1) || (topLeftButton.tag == 2 && midLeftButton.tag == 2 && bottomLeftButton.tag == 2) {
    return true
} else if (topMidButton.tag == 1 && midMidButton.tag == 1 && bottomMidButton.tag == 1) || (topMidButton.tag == 2 && midMidButton.tag == 2 && bottomMidButton.tag == 2) {
    return true
} else if (topRightButton.tag == 1 && midRightButton.tag == 1 && bottomRightButton.tag == 1) || (topRightButton.tag == 2 && midRightButton.tag == 2 && bottomRightButton.tag == 2) {
    return true
} else if (topRightButton.tag == 1 && midMidButton.tag == 1 && bottomLeftButton.tag == 1) || (topRightButton.tag == 2 && midMidButton.tag == 2 && bottomLeftButton.tag == 2) {
    return true
} else if (topLeftButton.tag == 1 && midMidButton.tag == 1 && bottomRightButton.tag == 1) || (topLeftButton.tag == 2 && midMidButton.tag == 2 && bottomRightButton.tag == 2) {
    return true
}*/
