//
//  SignUpWithPhoneViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/4/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class SignUpWithPhoneViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var configureButton: ConfigureButtonsWithTextFields!

    override func viewDidLoad() {
        super.viewDidLoad()

    configureButton = ConfigureButtonsWithTextFields(textFields: [fullNameTextField , passwordTextField], button: nextButton)
        
    }
    


}
