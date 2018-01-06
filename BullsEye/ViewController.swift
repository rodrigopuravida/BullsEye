//
//  ViewController.swift
//  BullsEye
//
//  Created by Rodrigo Carballo on 12/30/17.
//  Copyright © 2017 Rodrigo Carballo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        roundLabel.text = String(1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startOver() {
        currentValue = 0
        score = 0
        round = 1
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()
    }
    
    @IBAction func showAlert() {

        let difference = abs(currentValue - targetValue)
        var points = 100 - difference

        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            points += 100
        }
        else if (difference < 5) {
            title = "You almost had it"
            if (difference == 1) {
                points += 50
            }
        }
        else if (difference < 10){
            title = "Pretty Good"
        }
        else {
            title = "Not even close"
        }
        score += points
        
        let message = "You scored \(points) points"
        
        
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func sliderMove(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        round += 1
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }


}

