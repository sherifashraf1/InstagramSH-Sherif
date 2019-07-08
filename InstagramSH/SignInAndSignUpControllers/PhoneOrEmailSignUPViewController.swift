//
//  PhoneOrEmailSignUPViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/3/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class PhoneOrEmailSignUPViewController: UIViewController {

    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var buttomLineView: UIView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var descriptionSMSLabel: UILabel!
    lazy var phoneViewShadow = UIView(frame: CGRect(x: buttomLineView.frame.minX, y: 0, width: buttomLineView.frame.width/2 , height: buttomLineView.frame.height))
    // let phoneViewShadow = UIView(frame: CGRect(x: 0, y: 0, width: 207, height: 1))
    lazy var emailViewShadow = UIView(frame: CGRect(x: buttomLineView.frame.midX, y: 0, width: buttomLineView.frame.width/2 , height: buttomLineView.frame.height))
    // let emailViewShadow = UIView(frame: CGRect(x: 207, y: 0, width: 207, height: 1))

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        phoneButton.isHighlighted = false
        emailButton.isHighlighted = true
        emailTextField.isHidden = true
        phoneViewShadow.backgroundColor = UIColor.black
        phoneViewShadow.layer.borderWidth = 4
        buttomLineView.addSubview(phoneViewShadow)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton = ConfigureButtonsWithTextFields(textFields:[phoneTextField], button: nextButton)
        let phoneCodeCountries = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20)) // add a phonecode countries to textfield
        phoneCodeCountries.setTitle("EG +20", for: .normal)
        phoneCodeCountries.titleLabel?.font = .boldSystemFont(ofSize: 10)
        phoneCodeCountries.setTitleColor(.init(red: 154/255, green: 202/255, blue: 247/255, alpha: 1), for: .normal)
        phoneTextField.leftViewMode = UITextField.ViewMode.always
        phoneTextField.leftView = phoneCodeCountries
        
    }
    
    @IBAction func didPressPhoneButton(_ sender: Any) {
        configureButton = ConfigureButtonsWithTextFields(textFields:[phoneTextField], button: nextButton)
        buttomLineView.subviews.forEach { $0.removeFromSuperview() } // to remove a emailViewShadow "subview"
        descriptionSMSLabel.isHidden = false
        emailTextField.isHidden = true
        emailTextField.text = ""
        emailButton.isHighlighted = true
        phoneTextField.isHidden = false
        phoneViewShadow.backgroundColor = UIColor.black
        phoneViewShadow.layer.borderWidth = 4
        buttomLineView.addSubview(phoneViewShadow)
        
    }
    
    @IBAction func didPressEmailButton(_ sender: Any) {
        configureButton = ConfigureButtonsWithTextFields(textFields:[emailTextField], button: nextButton)
        buttomLineView.subviews.forEach { $0.removeFromSuperview() } //to remove a phoneViewShadow "subview"
        descriptionSMSLabel.isHidden = true
        phoneButton.isHighlighted = true
        phoneTextField.isHidden = true
        phoneTextField.text = ""
        emailTextField.isHidden = false
        emailViewShadow.backgroundColor = UIColor.black
        emailViewShadow.layer.borderWidth = 4
        buttomLineView.addSubview(emailViewShadow)
        
    
    }
    
    
    @IBAction func DidPressOnnextButton(_ sender: Any) {
            let confirmationView = self.storyboard?.instantiateViewController(withIdentifier: "EnterConfirmationCode") as! EnterConformationCodeViewController
        if(phoneButton.isHighlighted == false && phoneTextField.text != "" && emailButton.isHighlighted == true && emailTextField.text == ""){
            self.present(confirmationView, animated: true, completion: nil)
            
    }
      
        
    }
    
    
    
}
    


