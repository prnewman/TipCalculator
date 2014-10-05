//
//  ViewController.swift
//  TipCalculator
//
//  Created by Paul Newman on 10/5/14.
//  Copyright (c) 2014 Newman Zone. All rights reserved.
//

import UIKit
//import <TipCalculatorModel>

class ViewController: UIViewController {

    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxPctSlider: UISlider!
    @IBOutlet weak var taxPctLabel: UILabel!
    @IBOutlet weak var resultsTextView: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    //let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    let tipCalc = TipCalculatorModel(total: 100.00, taxPct: 0.10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        // 1
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        // 2
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        // 3
        taxPctLabel.text = "Tax Percent (\(Int(taxPctSlider.value))%):"
        // 4
        resultsTextView.text = ""
    }
    
    // MARK: UIControl handlers

    @IBAction func calculateButtonTapped(sender : AnyObject) {
        
        // 1
        let total:NSString = totalTextField.text
        tipCalc.total = total.doubleValue
        // 2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        // 3
        for (tipPct, tipValue) in possibleTips {
            // 4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        // 5
        resultsTextView.text = results
    }
    
    @IBAction func sliderChanged(sender : AnyObject) {
        
        println("\(Int(self.taxPctSlider.value))");
        
        let slider:UISlider = (sender as UISlider);
        tipCalc.taxPct = Double(slider.value) / 100.0

        println("\(tipCalc.taxPct)");

        refreshUI()
    }
    
    // MARK: Gesture handler
    
    @IBAction func viewTapped(sender : AnyObject) {
        
        let tap:UITapGestureRecognizer = (sender as UITapGestureRecognizer);
        
        totalTextField.resignFirstResponder()

    }
}

