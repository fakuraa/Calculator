//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Fadil Kurniawan on 25/07/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number : Double?
    private var intermediateCalc: (n1:Double, calcMethod:String)?
    
    mutating func setNumber(_ number:Double){
        self.number = number
    }
    
   mutating func calculate(symbol : String) -> Double? {
        if let n = number {
            switch symbol {
                case "+/-" :
                    return n * -1
                case "AC" :
                    return 0
                case "%" :
                    return n * 0.01
                case "=" :
                    return performTwoNumCalc(n2:n)
                default :
                    intermediateCalc = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalc(n2:Double)->Double?{
        if let n1 = intermediateCalc?.n1, let operation = intermediateCalc?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                return n1
            }
        }
        return nil
    }
}
