//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Gabrielle Miller-Messner on 10/30/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var match: RPSMatch!
    
    var message: NSString!
    var  picture: UIImage!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        self.messageLabel.text = messageForMatch(match)
        self.resultImageView.image = imageForMatch(match)
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 1.5)
        {
            self.resultImageView.alpha = 1;
        }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: AnyObject)
    {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func messageForMatch(_ match: RPSMatch) -> String {
        
        // Handle the tie
        if match.p1 == match.p2 {
            return "It's a tie!"
        }
        
        return match.winner.description + " " + victoryModeString(match.winner) + " " + match.loser.description + ". " + resultString(match)
    }
    
    func resultString(_ match: RPSMatch) -> String {
        return match.p1 > match.p2 ? "You Win!" : "You Lose!"
    }
    
    
    func victoryModeString(_ gesture: RPS) -> String {
        switch (gesture) {
        case .rock:
            return "crushes"
        case .scissors:
            return "cuts"
        case .paper:
            return "covers"
        }
    }
    
    func imageForMatch(_ match: RPSMatch) -> UIImage {
        
        var name = ""
        
        switch (match.winner) {
        case .rock:
            name = "RockCrushesScissors"
        case .paper:
            name = "PaperCoversRock"
        case .scissors:
            name = "ScissorsCutPaper"
        }
        
        if match.p1 == match.p2 {
            name = "itsATie"
        }
        return UIImage(named: name)!
    }
}
