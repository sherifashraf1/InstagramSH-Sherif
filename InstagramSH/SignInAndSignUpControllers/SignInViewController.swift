//
//  SignInViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/3/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit
var configureButton: ConfigureButtonsWithTextFields!
class SignInViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //passwordTextField.isSecureTextEntry = true
        configureButton = ConfigureButtonsWithTextFields(textFields: [userNameTextField , passwordTextField], button: loginButton)
    }
    

}
