//
//  ViewController.swift
//  Calculator
//
//  Created by Idris Adrien on 23/10/2017.
//  Copyright © 2017 Idris Adrien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var opeLabel: UILabel!
    var num1: Int = 0
    var num2: Int = 0
    @IBAction func didPressButton(_ sender: Any) {
        guard let button = sender as? UIButton else {
            print("USE ONLY WITH NUMBERS")
            return
        }
        guard let labeltext = resultLabel.text, let buttonText = button.titleLabel?.text else {
            print("must not append")
            return
        }
        self.resultLabel.text = labeltext + buttonText
            }
    // Action on operation button
    @IBAction func didPressOperation(_ sender: Any) {
        guard let button = sender as? UIButton
            else {
                return
        }
        opeLabel.text = button.titleLabel?.text
        self.num1 = Int(resultLabel.text!) ?? 0
        resultLabel.text = "0"
    }
    // Action on equal button
    @IBAction func opAction(_ sender: Any) {
        guard let operation: String = opeLabel.text else {
            return
        }
        switch operation {
        case "+":
            self.num2 = Int(resultLabel.text!)! + num1
            resultLabel.text = String(num2)
        case "x":
            self.num2 = Int(resultLabel.text!)! * num1
            resultLabel.text = String(num2)
        case "-":
            self.num2 = Int(resultLabel.text!)! - num1
            resultLabel.text = String(num2)
        case "/":
            self.num2 = Int(resultLabel.text!)! / num1
            resultLabel.text = String(num2)
        default:
            return
        }
    }
    // Action on Clear button
    @IBAction func didPressClear(_ sender: Any) {
        resultLabel.text = "0"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let env = Bundle.main.infoDictionary!["EqualColor"] as! String
        if env == "yellow" {
            super.view.backgroundColor = .black
        }else{
            super.view.backgroundColor = .lightGray
        }
        self.resultLabel.text = "0"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.resultLabel.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2) {
            self.resultLabel.alpha = 1
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        super.view.backgroundColor = .yellow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
