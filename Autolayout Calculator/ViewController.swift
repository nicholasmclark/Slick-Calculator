//
//  ViewController.swift
//  Autolayout Calculator
//
//  Created by Nicholas Clark on 1/1/18.
//  Copyright © 2018 Slick Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var performingMath : Bool = false
    var operation = 0
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            display.text = String(sender.tag - 1)
            numberOnScreen = Double(display.text!)!
            performingMath = false
        }
        else {
        display.text = display.text! + String(sender.tag - 1)
        numberOnScreen = Double(display.text!)!
        }
    }

    @IBAction func buttons(_ sender: UIButton) {
        if display.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(display.text!)!
            
            if sender.tag == 12 //divide
            {
                display.text = "/"
            }
            else if sender.tag == 13 //multiply
            {
                display.text = "x"
            }
            else if sender.tag == 14 //subtract
            {
                display.text = "-"
            }
            else if sender.tag == 15 //add
            {
                display.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16 {
            if operation == 12 {
                display.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {
                display.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {
                display.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                display.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            display.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
}

