//
//  SignInViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/3/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit





class SignInViewController: UIViewController{
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var configureButton: ConfigureButtonsWithTextFields!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
        userNameTextField.delegate = self
        passwordTextField.delegate = self

        configureButton = ConfigureButtonsWithTextFields(textFields: [userNameTextField , passwordTextField], button: loginButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func hideKeyboard() {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
   
    
    @IBAction func loginButton(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @objc func keyboardWillChange(notification : Notification){
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -60
        } else {
            view.frame.origin.y = 0

        }

     }
}
        


extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === userNameTextField {
            passwordTextField.becomeFirstResponder()
        }else{
            hideKeyboard()
        }
        return true
    }

}
