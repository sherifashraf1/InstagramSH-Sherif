//
//  ShowImageViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/13/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController ,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var selectedImage =  UIImage()
    var imageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self

}
}
