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
    var gestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configScrollViewImage()
        configDoubleTapToZoomImage()
        //dismissScrollViewImage()
        dragUpImage()
        dragDownImage()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
//    func dismissScrollViewImage(){
//        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dismissImage(_:)))
//        view.addGestureRecognizer(gestureRecognizer)
//    }
//    @IBAction func dismissImage(_ gesture: UIPanGestureRecognizer) {
//        let touchPoint = gesture.location(in: self.view)
//        var initialTouchPoint = CGPoint.zero
//
//        switch gesture.state {
//        case .began:
//            initialTouchPoint = touchPoint
//        case .changed:
//            if touchPoint.y - initialTouchPoint.y > 0 {
//                self.view.frame.origin.y = touchPoint.y - initialTouchPoint.y
//
//            }
//        case .ended, .cancelled:
//            if touchPoint.y - initialTouchPoint.y > 100 {
//            self.navigationController?.popViewController(animated: true)
//            }
//            else {
//                UIView.animate(withDuration: 0.3, animations: {
//                    self.view.frame = CGRect(x: 0,
//                                             y: 0,
//                                             width: self.view.frame.size.width,
//                                             height: self.view.frame.size.height)
//                })
//
//            }
//        case .failed, .possible:
//            break
//        @unknown default:
//            fatalError("there is an error")
//        }
//    }
//

    
    func configScrollViewImage(){
        imageView = UIImageView(image: selectedImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        imageView.isUserInteractionEnabled = true
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
    
    func configDoubleTapToZoomImage(){
        let doubleTap = UITapGestureRecognizer.init(target: self, action: #selector(self.doubleTapped(recognizer:)))
        doubleTap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTap)
        
    }
    
    @objc func doubleTapped(recognizer: UITapGestureRecognizer){
        print("Tap Working")
        if (self.scrollView!.zoomScale == self.scrollView!.minimumZoomScale) {
            let center = recognizer.location(in: self.scrollView!)
            let size = self.imageView!.image!.size
            let zoomRect = CGRect(x: center.x, y: center.y, width: (size.width / 2), height: (size.height / 2))
            self.scrollView!.zoom(to: zoomRect, animated: true)
        } else {
            self.scrollView!.setZoomScale(self.scrollView!.minimumZoomScale, animated: true)
        }

    }
    
//    func configPanGesture(){
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onClickImage))
//        imageView.addGestureRecognizer(panGesture)
//    }
//
//    @objc func onClickImage(recognizer : UIPanGestureRecognizer){
//        let translation = recognizer.translation(in: self.view)
//        if let view = recognizer.view{
//            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
//        }
//        recognizer.setTranslation(CGPoint.zero, in: self.view)
//    }
    
    
//    func configDragToDismissImage(){
//        let doubleTap = UITapGestureRecognizer.init(target: self, action: #selector(self.DragToDismis(recognizer:)))
//        imageView.addGestureRecognizer(doubleTap)
//
//    }
//
//    @objc func DragToDismis(recognizer: UITapGestureRecognizer){
//        print("Tap Working")
//
//        self.dismiss(animated: true, completion: nil)
//    }
    
    func dragUpImage(){
        let slideUp = UISwipeGestureRecognizer(target: self, action: #selector(dragImage(gesture:)))
        slideUp.direction = .up
        view.addGestureRecognizer(slideUp)
    }
    
    func dragDownImage(){
        let slideDown = UISwipeGestureRecognizer(target: self, action: #selector(dragImage(gesture:)))
        slideDown.direction = .down
        view.addGestureRecognizer(slideDown)
    }
   
//    @objc func dragImage(gesture: UISwipeGestureRecognizer) {
//        UIView.animate(withDuration: 0.3) {
//            if let window = UIApplication.shared.keyWindow { // keyWindo is the main window that receive an event , in this case it receive the gesture
//                gesture.view?.frame = CGRect(x:window.frame.width  , y: window.frame.height  , width: 5 , height: 5)
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
//    }
    
    @objc func dragImage(gesture: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.3) {
            if let window = UIApplication.shared.keyWindow { // keyWindo is the main window that receive an event , in this case it receive the gesture
                gesture.view?.frame = CGRect(x:window.frame.width  , y: window.frame.height  , width: 5 , height: 5)
                self.dismiss(animated: true, completion: nil)
                //self.navigationController?.popViewController(animated: true)
                //self.navigationController?.navigationBar.isHidden = false
                self.tabBarController?.tabBar.isHidden = false
            }
        }
    }
    
    
    

}
