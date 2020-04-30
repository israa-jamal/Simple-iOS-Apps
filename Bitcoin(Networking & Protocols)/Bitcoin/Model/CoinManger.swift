//
//  CoinManger.swift
//  Bitcoin
//
//  Created by Esraa Gamal on 4/30/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func updatePrice(price: String, currency: String)
    func failedWithError(error: Error)
}

struct CoinManger{
    
    var delegate : CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "756B2C63-3A10-473D-8250-9A11223EB17C"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","EGP","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency : String)
    {
        //url for getting the bitcoin price in selected currency
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        if let url = URL(string: urlString) {
            
            //creating session for networking
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    
                    self.delegate?.failedWithError(error: error!)
                    return
                }
                //getting the data from the url
                if let safeData = data {
                    let bitcoinPrice = self.parseJSON(safeData)!
                    let bitcoinString = String(format: "%.2f", bitcoinPrice)
                    
                    self.delegate?.updatePrice(price: bitcoinString, currency: currency)
                }
            }
            //Start task
            task.resume()
        }
        
    }
    
    func parseJSON(_ data: Data) -> Double? {
        
        let decoder = JSONDecoder()
        do {
            //decoding the data we got from the url
            let decodedData = try decoder.decode(CoinData.self, from: data)
            //Get the rate property from the decoded data.
            let price = decodedData.rate
            return price
            
        } catch {
            delegate?.failedWithError(error: error)
            return nil
        }
    }
    
}
