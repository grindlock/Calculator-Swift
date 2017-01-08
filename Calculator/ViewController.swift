//
//  ViewController.swift
//  Calculator
//
//  Created by Sergio Perez-Aponte on 1/6/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressed(){
        
        text.text = "Hello World! "
        
    }


}

