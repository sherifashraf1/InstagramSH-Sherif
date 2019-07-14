//
//  ViewController.swift
//  IDEScroll
//
//  Created by Abdoelrhman Eaita on 7/14/19.
//  Copyright © 2019 Abdoelrhman Eaita. All rights reserved.
//

import UIKit

class ImageViewer: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageToView: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.maximumZoomScale = 6
        
        imageView.image = imageToView
        
    }

}

extension ImageViewer: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    
}
