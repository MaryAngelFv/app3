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
    
    var fibonacci : [Int] = []
    var fibId = 1
    

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
    }
    
}

