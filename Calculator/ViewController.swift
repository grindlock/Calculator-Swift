//
//  ViewController.swift
//  Calculator
//
//  Created by Sergio Perez-Aponte on 1/6/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // Here I made an infere type constant
    let defaultTxt = "0.0"
    // Here I made making an explecit type constant
    let cRadius:CGFloat = 10
    
    enum Oper:String {
        case Division = "/"
        case Multiplication = "*"
        case Subtraction = "-"
        case Addition = "+"
        case Percent = "%"
        case Negative = "*(-1)"
        case Empty = "Empty"
    }
    
    var grabTxt=""
    var leftNum = ""
    var rightNum = ""
    var result = ""
    var operSelected = Oper.Empty
    
    @IBOutlet weak var screenBackground: UIView!
    @IBOutlet weak var screen:UILabel!
    
    var audioPlayer: AVAudioPlayer!
    let numbers = "keyboard_key"
    let operations = "keyboard_tap"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen.layer.cornerRadius = cRadius
        screen.layer.masksToBounds = true
        screenBackground.layer.cornerRadius = cRadius
        
        screen.text = defaultTxt
        
        
        
        print("go",operSelected)
    }

    @IBAction func numBtnPressed(sender: UIButton){
        
        if (screen.text?.characters.count)! < 9
        {
            if sender.tag == 10 && !grabTxt.contains("."){
                // ternary expresion
                 grabTxt += screen.text == defaultTxt ? "0." : "."
                
            }else{
                grabTxt += sender.tag != 10 ? "\(sender.tag)":""
            }
            screen.text = grabTxt
        }
         playSound(sound: numbers)
    }
    
    
    @IBAction func clearPressed(_ sender: AnyObject) {
        grabTxt = ""
        operSelected = Oper.Empty
        screen.text = defaultTxt
         playSound(sound: operations)
    }
    
    @IBAction func changeSignPressed(_ sender: AnyObject) {
        if grabTxt != "" {
            let n = Double(grabTxt)! * -1
            grabTxt = "\(n)"
            screen.text = grabTxt
        }
         playSound(sound: operations)
    }
    
    @IBAction func percentPressed(_ sender: AnyObject) {
        if grabTxt != "" {
            let n = Double(grabTxt)! / 100
            grabTxt = "\(n)"
            screen.text = grabTxt
        }
        playSound(sound: operations)
    }

    @IBAction func divisionPressed(_ sender: AnyObject) {
        doOperations(operation: .Division)
         playSound(sound: operations)
    }
    
    @IBAction func multiplicationPressed(_ sender: AnyObject) {
        doOperations(operation: .Multiplication)
         playSound(sound: operations)
    }
   
    @IBAction func subtractionPressed(_ sender: AnyObject) {
        doOperations(operation: .Subtraction)
         playSound(sound: operations)
    }
    @IBAction func additionPressed(_ sender: AnyObject) {
        doOperations(operation: .Addition)
         playSound(sound: operations)
    }
    @IBAction func equalPressed(_ sender: AnyObject) {
        doOperations(operation: operSelected)
         playSound(sound: operations)
    }
    
    func doOperations(operation: Oper){
        
        if operSelected != Oper.Empty{
            if grabTxt != ""{
                rightNum = grabTxt
                grabTxt = ""
                
                if operSelected == Oper.Division {result = "\(Double(leftNum)! / Double(rightNum)!)"}
                else if operSelected == Oper.Multiplication { result = "\(Double(leftNum)! * Double(rightNum)!)"}
                else if operSelected == Oper.Subtraction{ result = "\(Double(leftNum)! - Double(rightNum)!)"}
                else if operSelected == Oper.Addition{ result = "\(Double(leftNum)! + Double(rightNum)!)"}
                
                leftNum = result
                screen.text = result
            }
            operSelected = operation
            
        }
        else{
            leftNum = grabTxt
            grabTxt = ""
            operSelected = operation
        }
    }
    
    //Play sounds when butons are click
    func playSound(sound:String){
        
        let soundPath = Bundle.main.path(forResource: sound, ofType:"mp3")
        
        let path = URL(fileURLWithPath: soundPath!)
        
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: path)
            audioPlayer.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
        if !audioPlayer.isPlaying{
            audioPlayer.play()
        }else{
            audioPlayer.stop()
            audioPlayer.play()
        }
        
    }
}

