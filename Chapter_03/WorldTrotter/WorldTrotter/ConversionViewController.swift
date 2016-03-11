//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Joel Reeves on 3/11/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var celsiusLabel: UILabel!
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded it's view")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        switch getCurrentHour() {
        case 17..<23:
            self.view.backgroundColor = UIColor.darkGrayColor()
        default:
            self.view.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
    func getCurrentHour() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let hour = calendar.component(.Hour, fromDate: date)
        print("Current hour: \(hour)")
        return hour
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeperator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeperator = string.rangeOfString(".")
        
        if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeperator != nil {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(sender: UITextField) {
        if let text = sender.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
}