//
//  ViewController.swift
//  Bitcoin
//
//  Created by Esraa Gamal on 4/29/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitcoinAmountLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManger = CoinManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManger.delegate = self
    }


}

//MARK:- CoinManagerDelegate

extension ViewController : CoinManagerDelegate
{
    func updatePrice(price: String, currency: String) {
        DispatchQueue.main.async{
        //when user select currency display it and bitcoin rate
        self.bitcoinAmountLabel.text = price
        self.currencyLabel.text = currency
    }
    }
    
    func failedWithError(error: Error) {
        print(error)
    }
    
    
}

//MARK:- UIPickerView

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //selecting which elemnt to display in the picker
        return coinManger.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //setting the amount of elments in the picker view with currency array elemnts
     return coinManger.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // return the currency which is selcted to coin manger
        let selectedCurrency = coinManger.currencyArray[row]
        coinManger.getCoinPrice(for: selectedCurrency)
        
    }
    
    
}




