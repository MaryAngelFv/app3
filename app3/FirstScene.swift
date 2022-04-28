//
//  FirstScene.swift
//  app3
//
//  Created by Brayam Mora on 27/04/22.
//

import UIKit

class FirstScene: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    @IBOutlet weak var textName: UITextField!
    
    var userAge = 0
    var userName = ""
    
    
    @IBOutlet weak var yourNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourNameTextField.delegate = self
        self.updateAgeLabel()
    }
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        
        textField.resignFirstResponder()
        self.validateName()
        return true
    }
    
    
    @IBAction func sliderAgeMove(_ sender: UISlider) {
    
        self.updateAgeLabel()
    }
    
    func updateAgeLabel(){
        self.userAge = Int(self.sliderAge.value)
        self.labelAge.text = "\(self.userAge)"
    }
    
    @IBAction func validateDate(_ sender: UIButton) {
        
        validateName()
        var message = ""
        
        if userName == "Mary Angelica" {
            message = """
            Puedes pasar a la fiesta
            por ser Mary Angélica
            """
            self.view.backgroundColor = UIColor(red: 86.0/255.0, green: 212.0/255.0, blue: 79.0/255.0, alpha: 0.8)
        } else if userAge >= 18 {
            message = """
            Puedes pasar a la fiesta
            por ser mayor de edad
            """
            self.view.backgroundColor = UIColor(red: 53.0/255.0, green: 154.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        } else {
            message = """
            ¡Lo sentimos!
            No puedes pasar a la fiesta
            """
            self.view.backgroundColor = UIColor(red: 229.0/255.0, green: 56.0/255.0, blue: 40.0/255.0, alpha: 0.8)
        }
        
        let controller = UIAlertController(
            title: "Respuesta",
            message: "\(message)",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        
        controller.addAction(action)
        show(controller, sender: nil)
    }
    
    func validateName(){
        if let theText = textName.text {
            self.userName = theText
        }
    }
    
}
