//
//  SignInViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/3/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit
var configureButton: ConfigureButtonsWithTextFields!
class SignInViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          passwordTextField.isSecureTextEntry = true
          configureButton = ConfigureButtonsWithTextFields(textFields: [userNameTextField , passwordTextField], button: loginButton)
          userNameTextField.delegate = self
          passwordTextField.delegate = self

        // listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    
    }
     //stop listening for keyboard hide/show events
    deinit {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func hideKeyboard() {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("retrun pressed")
        
        hideKeyboard()
        return true
    }
    
    @IBAction func loginButton(_ sender: Any) {
        hideKeyboard()
    }
    
    
    @objc func keyboardWillChange(notification : Notification){
//         guard let keyboardRec = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else  {
//            return
//          }

        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -150
        } else {
            view.frame.origin.y = 0

        }

 }
    
}
        


