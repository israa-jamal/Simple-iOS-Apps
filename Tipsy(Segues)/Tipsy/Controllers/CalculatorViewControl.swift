//
//  ViewController.swift
//  Tipsy
//
//  Created by Esraa Gamal on 4/26/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class CalculatorViewControl: UIViewController {
    
    @IBOutlet weak var totalBillTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    var tip : Double = 0.0
    var numbOfPeople = 2
    var totalBill : Double = 0.0
    var billSplitted = "0.0"
    
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        totalBillTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numbOfPeople = Int(sender.value)
    }
    
    @IBAction func precentageButton(_ sender: UIButton) {
        
        //dismiss keyboard
        totalBillTextField.endEditing(true)
        //make every button not selected except the sender
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        sender.isSelected = true
        //transforming the button title to a decimal numb
        let precent =  sender.currentTitle!
        let precentString = String(precent.dropLast())
        let numb = Double(precentString)!
        tip = numb / 100.00
        
        
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        let bill = totalBillTextField.text!
        //only perform when the user enter something
        if bill != "" {
        //calculating the bill for each person
        totalBill = Double(bill)!
        let number = (totalBill * (1 + tip)) / Double(numbOfPeople)
        billSplitted = String(format: "%.2f", number)
        //when finished go to ResultsViewController
        self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    //preparing the segue before going to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            //hold the instance of ResultsViewController
            let destinationVC = segue.destination as! ResultsViewController
            
            //set ResultsViewController properties
            destinationVC.result = billSplitted
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numbOfPeople
            
        }
        
        
    }
}
