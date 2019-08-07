//
//  EnterConformationCodeViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/4/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class EnterConformationCodeViewController: UIViewController {

    @IBOutlet weak var confirmationCodeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var configureButton: ConfigureButtonsWithTextFields!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton = ConfigureButtonsWithTextFields(textFields: [confirmationCodeTextField], button: nextButton)
        
    }
    

}
