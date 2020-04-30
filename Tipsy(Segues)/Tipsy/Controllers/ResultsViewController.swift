//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Esraa Gamal on 4/30/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var billPerPersonLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    //default values
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billPerPersonLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."

    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        //going back to CalculatorViewController
        self.dismiss(animated: true, completion: nil)
    }
    

}
