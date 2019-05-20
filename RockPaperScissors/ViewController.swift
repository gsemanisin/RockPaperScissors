//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Gwyneth Semanisin on 5/20/19.
//  Copyright © 2019 Gwyneth Semanisin. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var computersChoiceLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var rockImage: UIImageView!
    @IBOutlet weak var paperImage: UIImageView!
    @IBOutlet weak var scissorsImage: UIImageView!
    
    var choices = ["Rock", "Paper", "Scissors"]
    var playersChoice : String?
    var computersChoice : String?
    var timer: Timer?
    var timeLeft = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rockTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        rockTap.numberOfTapsRequired = 2
        rockImage.addGestureRecognizer(rockTap)
        let paperTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        paperTap.numberOfTapsRequired = 2
        paperImage.addGestureRecognizer(paperTap)
        let scissorsTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        scissorsTap.numberOfTapsRequired = 2
        scissorsImage.addGestureRecognizer(scissorsTap)
        
    }

    @IBAction func rockPressed(_ sender: Any) {
        playersChoice = choices[0]
        timer?.invalidate()
        timer = nil
        startButton.isEnabled = true
        timeLeft = 3
        whoWins()
    }
    
    @IBAction func paperPressed(_ sender: Any) {
        playersChoice = choices[1]
        timer?.invalidate()
        timer = nil
        startButton.isEnabled = true
        timeLeft = 3
        whoWins()
    }
    
    @IBAction func scissorsPressed(_ sender: Any) {
        playersChoice = choices[2]
        timer?.invalidate()
        timer = nil
        startButton.isEnabled = true
        timeLeft = 3
        whoWins()
    }
    
    @objc func doubleTapped() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            var myPickerController = UIImagePickerController()

            myPickerController.delegate = self
            myPickerController.sourceType = .savedPhotosAlbum
            myPickerController.allowsEditing = false
            
            present(myPickerController, animated: true, completion: nil)
        }
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
            winner = "computer"
        }
        
        computersChoiceLabel.text = "Computer choose " + computersChoice!
        winnerLabel.text = "Winner is " + winner
    }
    
    @IBAction func onRulesPressed(_ sender: Any) {
        let url = URL(string: "https://www.wrpsa.com/the-official-rules-of-rock-paper-scissors/")
        let svc = SFSafariViewController(url: url!)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        startButton.isEnabled = false
    }
    
    @objc func countdown(){
        
        countdownLabel.text = "\(timeLeft)"
        timeLeft -= 1
        
        
        if timeLeft < 0 {
            timer?.invalidate()
            timer = nil
            startButton.isEnabled = true
            whoWins()
            timeLeft = 3
        }
        
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        rockImage.image = image
        dismiss(animated:true, completion: nil)
    }
    
}

