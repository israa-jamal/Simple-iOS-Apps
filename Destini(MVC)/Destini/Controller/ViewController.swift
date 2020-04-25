//
//  ViewController.swift
//  Destini
//
//  Created by Esraa Gamal on 4/26/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var destiniBrain = DestiniBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // start the story
        // Do any additional setup after loading the view.
    }


    @IBAction func nextButton(_ sender: UIButton) {
        destiniBrain.checkChoice(sender.currentTitle!) //get user choice
        updateUI()
    }
    func updateUI(){
        storyLabel.text = destiniBrain.getStory() 
        choice1Button.setTitle(destiniBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(destiniBrain.getChoice2(), for: .normal)
    }
}

