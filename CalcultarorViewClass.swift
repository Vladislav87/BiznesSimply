//
//  CalcultarorViewClass.swift
//  SimplifyingBusiness
//
//  Created by Владислав Ходеев on 08.01.17.
//  Copyright © 2017 Vlad Samoilov. All rights reserved.
//

import UIKit

class CalcultarorViewClass: UIViewController {
    @IBOutlet weak var ResultIndicatorField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var equals: UIButton!
    
    
    
    
    var result = Float()
    var currentNumber = Float()
    
    var currentOper = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        one.layer.cornerRadius = one.frame.height/2
        one.clipsToBounds = true
        one.layer.borderWidth = 2
        one.layer.borderColor = UIColor.white.cgColor
        
        two.layer.cornerRadius = two.frame.height/2
        two.clipsToBounds = true
        two.layer.borderWidth = 2
        two.layer.borderColor = UIColor.white.cgColor
        
        three.layer.cornerRadius = three.frame.height/2
        three.clipsToBounds = true
        three.layer.borderWidth = 2
        three.layer.borderColor = UIColor.white.cgColor
        
        four.layer.cornerRadius = four.frame.height/2
        four.clipsToBounds = true
        four.layer.borderWidth = 2
        four.layer.borderColor = UIColor.white.cgColor
        
        five.layer.cornerRadius = five.frame.height/2
        five.clipsToBounds = true
        five.layer.borderWidth = 2
        five.layer.borderColor = UIColor.white.cgColor
        
        six.layer.cornerRadius = six.frame.height/2
        six.clipsToBounds = true
        six.layer.borderWidth = 2
        six.layer.borderColor = UIColor.white.cgColor
        
        
        seven.layer.cornerRadius = seven.frame.height/2
        seven.clipsToBounds = true
        seven.layer.borderWidth = 2
        seven.layer.borderColor = UIColor.white.cgColor
        
        eight.layer.cornerRadius = eight.frame.height/2
        eight.clipsToBounds = true
        eight.layer.borderWidth = 2
        eight.layer.borderColor = UIColor.white.cgColor
        
        nine.layer.cornerRadius = nine.frame.height/2
        nine.clipsToBounds = true
        nine.layer.borderWidth = 2
        nine.layer.borderColor = UIColor.white.cgColor
        
        zero.layer.cornerRadius = zero.frame.height/2
        zero.clipsToBounds = true
        zero.layer.borderWidth = 2
        zero.layer.borderColor = UIColor.white.cgColor
        
        plus.layer.cornerRadius = plus.frame.height/2
        plus.clipsToBounds = true
        plus.layer.borderWidth = 2
        plus.layer.borderColor = UIColor.white.cgColor
        
        minus.layer.cornerRadius = minus.frame.height/2
        minus.clipsToBounds = true
        minus.layer.borderWidth = 2
        minus.layer.borderColor = UIColor.white.cgColor
        
        division.layer.cornerRadius = division.frame.height/2
        division.clipsToBounds = true
        division.layer.borderWidth = 2
        division.layer.borderColor = UIColor.white.cgColor
        
        multiplication.layer.cornerRadius = multiplication.frame.height/2
        multiplication.clipsToBounds = true
        multiplication.layer.borderWidth = 2
        multiplication.layer.borderColor = UIColor.white.cgColor
        
        equals.layer.cornerRadius = 20
        equals.clipsToBounds = true
        equals.layer.borderWidth = 2
        equals.layer.borderColor = UIColor.white.cgColor
        
        clear.layer.cornerRadius = clear.frame.height/2
        clear.clipsToBounds = true
        clear.layer.borderWidth = 2
        clear.layer.borderColor = UIColor.white.cgColor
        
        cancelButton.layer.cornerRadius = cancelButton.frame.width/2
        cancelButton.clipsToBounds = true
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = UIColor.white.cgColor
        
        
        
        
        currentOper = "="
        ResultIndicatorField.text = ("\(result)")

    }
    

    @IBAction func numbersButton(_ sender: UIButton) {
        
        
        currentNumber = currentNumber * 10 + Float(sender.titleLabel!.text!)!
        ResultIndicatorField.text = ("\(currentNumber)")
    }
    
    
    @IBAction func operationButton(_ sender: UIButton) {
        
        switch currentOper {
        case "=":
            result = currentNumber
        
        case "+":
            result = result + currentNumber
            
        case "-":
            result = result - currentNumber
            
        case "X":
            result = result * currentNumber
            
        case "/":
            result = result / currentNumber
            
            
            
        default:
            print("Неверная операция")
        }
        
        currentNumber = 0
        ResultIndicatorField.text = ("\(result)")
        
        if sender.titleLabel?.text == "="{
            result = 0
        }
        
        currentOper = sender.titleLabel?.text! as String!
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        
        result = 0
        currentNumber = 0
        currentOper = "="
        ResultIndicatorField.text = ("\(result)")
    }
   
    
    
    
    @IBAction func cancel(_ sender: AnyObject){
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
}
