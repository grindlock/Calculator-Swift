//
//  ViewController.swift
//  Calculator
//
//  Created by Sergio Perez-Aponte on 1/6/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaultTxt = "0.0"
    
    @IBOutlet weak var screen:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.text = defaultTxt
        //var txt = add()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func add ( btn: UIButton)->Int{
        
        switch(btn.tag){
        case 1: return 1
        case 2: return 2
        case 3: return 3
            
        default: return 0
        }
        return 0
    }*/

    @IBAction func equalBtnPressed(_ sender: UIButton) {
    }

}

