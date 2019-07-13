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
        configScrollViewImage()

}
    
    
    func configScrollViewImage(){
        imageView = UIImageView(image: selectedImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = 1.0
        scrollView.delegate = self
        scrollView.backgroundColor = .black
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
