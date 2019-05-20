//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Gwyneth Semanisin on 5/20/19.
//  Copyright © 2019 Gwyneth Semanisin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var computersChoiceLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    var choices = ["Rock", "Paper", "Scissors"]
    var playersChoice : String?
    var computersChoice : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rockPressed(_ sender: Any) {
        playersChoice = choices[0]
        print(playersChoice)
        whoWins()
    }
    
    @IBAction func paperPressed(_ sender: Any) {
        playersChoice = choices[1]
        whoWins()
    }
    
    @IBAction func scissorsPressed(_ sender: Any) {
        playersChoice = choices[2]
        whoWins()
    }
    
    func whoWins() {
        let choice = CGFloat.random(in: (0...2))
        computersChoice = choices[Int(choice)]
        var winner = ""
        
        switch playersChoice {
        case "Rock":
            if computersChoice == "Rock" {
                winner = "tie"
            }
            else if computersChoice == "Paper" {
                winner = "computer"
            }
            else {
                winner = "player"
            }
        case "Paper":
            if computersChoice == "Rock" {
                winner = "player"
            }
            else if computersChoice == "Paper" {
                winner = "tie"
            }
            else {
                winner = "computer"
            }
        case "Scissors":
            if computersChoice == "Rock" {
                winner = "computer"
            }
            else if computersChoice == "Paper" {
                winner = "player"
            }
            else {
                winner = "tie"
            }
        default:
            break
        }
        
        computersChoiceLabel.text = "Computer choose " + computersChoice!
        winnerLabel.text = "Winner is " + winner
    }
    
   
    
}

