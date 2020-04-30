//
//  ViewController.swift
//  Tipsy
//
//  Created by Esraa Gamal on 4/26/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class CalculatorViewControl: UIViewController {
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var totalBillTextField: UITextField!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hey")
    }
    
    @IBAction func precentageButton(_ sender: UIButton) {
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
    }
}

