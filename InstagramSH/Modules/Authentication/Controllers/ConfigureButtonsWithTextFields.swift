//
//  ConfigureButtonsWithTextFields.swift
//  InstagramSH
//
//  Created by Sherif on 7/4/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import Foundation
import UIKit

class ConfigureButtonsWithTextFields {
    
    private let textFields: [UITextField]
    private let button: UIButton
    
    init(textFields: [UITextField], button: UIButton) {
        
        self.textFields = textFields
        self.button = button
        
        attachTargetsToTextFields()
        disableButtons()
        checkForEmptyFields()
    }
    
    //Attach editing changed listeners to all textfields passed in
    private func attachTargetsToTextFields() {
        for textfield in textFields{
            textfield.addTarget(self, action: #selector(textFieldsIsNotEmpty), for: .editingChanged)
        }
    }
    
    @objc private func textFieldsIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        checkForEmptyFields()
    }
    
    //Returns true if the field is empty, false if it not
    private func checkForEmptyFields() {
        
        for textField in textFields{
            guard let textFieldVar = textField.text, !textFieldVar.isEmpty else {
                disableButtons()
                return
            }
        }
        enableButtons()
    }
    
    private func enableButtons() {
        button.isEnabled = true
        button.backgroundColor = .init(red: 55/255, green: 150/255, blue: 240/255, alpha: 1)
    }
    
    private func disableButtons() {
        button.isEnabled = false
        button.backgroundColor = .init(red: 154/255, green: 202/255, blue: 247/255, alpha: 1)
        
    }
    
}
