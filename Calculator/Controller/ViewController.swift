//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishTypingNumber: Bool = true
    private var displayVal:Double {
        set{
            displayLabel.text = String(newValue)
        }
        get{
            guard let number = Double(displayLabel?.text ?? "0") else{
                fatalError("Can't convert display label text to a Double.")
            }
            return number
        }
    }
    
    private var calculate = CalculatorLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        calculate.setNumber(displayVal)
        isFinishTypingNumber = true
        if let calcMethod = sender.currentTitle {
            if let result = calculate.calculate(symbol: calcMethod){
                displayVal = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle{
            if isFinishTypingNumber {
                displayLabel.text = numValue
                isFinishTypingNumber = false
            }else{
                if numValue == "." {
                    let isInt = floor(displayVal) == displayVal
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
        
    }

}

