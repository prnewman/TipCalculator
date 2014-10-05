//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Paul Newman on 10/5/14.
//  Copyright (c) 2014 Newman Zone. All rights reserved.
//

import Foundation

// 1
class TipCalculatorModel
{
    // main body
    
    // 2
    var total:Double
    var taxPct:Double
    var subtotal:Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    // 3
    init(total:Double, taxPct:Double)
    {
        self.total = total
        self.taxPct = taxPct
    }
    
    // 4
    func calcTipWithTipPct(tipPct:Double) -> Double
    {
        return subtotal * tipPct
    }
    
    // Note that [Int: Double] is just a shortcut for Dictionary<Int, Double>
    func returnPossibleTips() -> [Int: Double]
    {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
//        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        var retval = [Int: Double]() // declare new Dictionary
        
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
}
