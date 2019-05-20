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
        
        whoWins()
    }
    
    @IBAction func paperPressed(_ sender: Any) {
        playersChoice = choices[1]
    }
    
    @IBAction func scissorsPressed(_ sender: Any) {
        playersChoice = choices[2]
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
        default:
            break
        }
    }
    
}

