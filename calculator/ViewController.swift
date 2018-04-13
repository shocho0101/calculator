//
//  ViewController.swift
//  calculator
//
//  Created by 張翔 on 2018/03/31.
//  Copyright © 2018年 sho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var calcLablel: UILabel!
    
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    
    var ope: opeType = .noOpe
    
    enum opeType{
        case plus
        case minus
        case multiply
        case divide
        case noOpe
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func number(sender: UIButton){
        number1 = number1 * 10 + sender.tag
        label.text = String(number1)
        calcLablel.text = calcLablel.text?.appending(String(sender.tag))
    }
    
    @IBAction func opeButton(sender: UIButton){
        switch sender.tag {
        case 11:
            ope = .plus
            calcLablel.text = calcLablel.text?.appending("+")
        case 12:
            ope = .minus
            calcLablel.text = calcLablel.text?.appending("-")
        case 13:
            ope = .multiply
            calcLablel.text = calcLablel.text?.appending("×")
        case 14:
            ope = .divide
            calcLablel.text = calcLablel.text?.appending("÷")

        default:
            break
        }
        
        number2 = number1
        number1 = 0
    }
    
    @IBAction func equal(){
        switch ope {
        case .plus:
            number3 = number2 + number1
            calcLablel.text = calcLablel.text?.appending("=")
        case .minus:
            number3 = number2 - number1
            calcLablel.text = calcLablel.text?.appending("=")
        case .multiply:
            number3 = number2 * number1
            calcLablel.text = calcLablel.text?.appending("=")
        case .divide:
            number3 = number2 / number1
            calcLablel.text = calcLablel.text?.appending("=")
        case .noOpe:
            return
        }
        label.text = String(number3)
    }
    
    @IBAction func clear(){
        number1 = 0
        number2 = 0
        number3 = 0
        
        ope = .noOpe
        
        label.text = String(number1)
        calcLablel.text = ""
    }

}

