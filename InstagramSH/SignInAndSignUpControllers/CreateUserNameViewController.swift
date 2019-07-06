//
//  CreateUserNameViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/4/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class CreateUserNameViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButton = ConfigureButtonsWithTextFields(textFields: [userNameTextField], button: nextButton)
    }
    

 

}
