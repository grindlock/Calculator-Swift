//
//  ViewController.swift
//  Calculator
//
//  Created by Sergio Perez-Aponte on 1/6/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Here I made an infere type constant
    let defaultTxt = "0.0"
    // Here I made making an explecit type constant
    let cRadius:CGFloat = 10
    
    enum Oper:String{
        case Division = "/"
        case Multiplication = "*"
        case Subtraction = "-"
        case Addition = "+"
        case Mod = "%"
        case Negative = "*(-1)"
        case Empty = "Empty"
    }
    
    var grabTxt=""
    var operSelected = Oper.Empty
    
  
    
    @IBOutlet weak var screenBackground: UIView!
    @IBOutlet weak var screen:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.layer.cornerRadius = cRadius
        screen.layer.masksToBounds = true
        screenBackground.layer.cornerRadius = cRadius
        
        screen.text = defaultTxt
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    @IBAction func numBtnPressed(sender: UIButton){
        
        if (screen.text?.characters.count)! < 12
        {
            grabTxt += "\(sender.tag)"
            screen.text = grabTxt
        }
    
    }
  

}

