//
//  SignUpViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/3/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func backButton(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 1 ,2 :
            self.dismiss(animated: true, completion: nil)

        default:
            print("error")
        }
        
    }


}
