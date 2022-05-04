//
//  SecondScene.swift
//  app3
//
//  Created by Brayam Mora on 27/04/22.
//

import UIKit

class SecondScene: UIViewController {
    
    
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var stepperNumber: UIStepper!
    @IBOutlet weak var textViewResult: UITextView!
    @IBOutlet weak var labelGoldNum: UILabel!
    
    var fibonacci : [Int] = []
    var fibId = 1
    var calGoldNum = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel(id: Int(self.stepperNumber.value))
        generateFibonacci()
    }
    
    func generateFibonacci(){
        
        fibonacci = [0,1]
        for i in 2...fibId {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
        
        let fibonacciStr : [String] = fibonacci.map({String($0)})
        let result: String = fibonacciStr.joined(separator: "\n")
        self.textViewResult.text = result
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        updateLabel(id: Int(sender.value))
        generateFibonacci()
    }
    
    func updateLabel(id: Int) {
        self.fibId = id
        self.labelNumber.text = "\(self.fibId)"
        calculateGoldNum()
    }
    
    @IBAction func switchMove(_ sender: UISwitch) {
        self.calGoldNum = sender.isOn
        calculateGoldNum()
    }
    
    func calculateGoldNum() {
        if(self.calGoldNum) {
            let last = Double(fibonacci[fibonacci.count - 1])
            let previous = Double(fibonacci[fibonacci.count - 2])
            let goldNum = last / previous
            self.labelGoldNum.text = "\(goldNum)"
            
        } else {
            self.labelGoldNum.text = "Ver el número de oro"
        }
    }
}

