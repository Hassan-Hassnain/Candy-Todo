//
//  RegisterVCViewController.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 28/10/2020.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var emailTextField: AuthTextField!
    @IBOutlet weak var passwordTextField: AuthTextField!
    @IBOutlet weak var confirmPasswordField: AuthTextField!
    
    var email: String {
        get{emailTextField.text ?? K.emptyString}
        set{emailTextField.text = newValue}
    }
    
    var password: String {
        get{passwordTextField.text ?? K.emptyString}
        set{passwordTextField.text = newValue}
    }
    
    var confirmPassword: String {
        get{confirmPasswordField.text ?? K.emptyString}
        set{confirmPasswordField.text = newValue}
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func haveAccountButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        print(email)
        print(password)
        print(confirmPassword)
    }
    
}
