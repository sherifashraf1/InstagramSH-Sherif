//
//  HomeViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/5/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var postImages : [String] = ["doaa" , "essam" , "me" , "sherif" , "amr_diab" , "hands" , "neymar" ,"cristiano"]
    
    var postUserName = ["Sherif Ashraf","Osama Ahmed","Ahmed Mohamed","Mahmoud Fekry","Ehab Nagi","Sherif Ahmed" , "Mohamed Gamal","Omar Ahmed"]
    
    
    enum HomeTableSection : CaseIterable{ //CaseIterable is a protocol to use the enum like as array the each case is an indexpath
        case stories                    // indexpath 0
        case newsFeed                   // indexpath 1
        case newsFeedSimple
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(cell: NewsFeedCell.self)
        tableView.registerNib(cell: NewsTableViewCell.self)
    }
    
}

extension HomeViewController:  UITableViewDataSource , UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeTableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // عايز اعرف هو واقف دلوقتى عند السكشن رقم كام
        let section = HomeTableSection.allCases[section]
        switch section {
        case .stories :
            return 1
        case .newsFeed, .newsFeedSimple :
            return postImages.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = HomeTableSection.allCases[indexPath.section] // عايز اعرف هو واقف دلوقتى عند السكشن رقم كام
        
        switch section {
        case .stories :
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell") as! StoryTableViewCell
            return cell
            
        case .newsFeed :
            // let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
            let cell = tableView.dequeue() as NewsFeedCell
            cell.userPostImage.image = UIImage(named: postImages[indexPath.row])
            cell.userNamePostButton.setTitle(postUserName[indexPath.row], for: .normal)
            
            cell.userPostImage.isUserInteractionEnabled = true
            cell.userPostImage.isMultipleTouchEnabled = true
//            let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
//            tapgesture.numberOfTapsRequired = 1
//            cell.userPostImage.addGestureRecognizer(tapgesture)
//            
            return cell
            
        case .newsFeedSimple:
            let cell = tableView.dequeue() as NewsTableViewCell
            cell.thumbImageView.image = UIImage(named: postImages[indexPath.row])
            cell.descriptionLabel.text = postUserName[indexPath.row]
            return cell
        }
        
    }
    
    
    
    
    
    @objc func tapImage(_ gesture : UIGestureRecognizer){
        let tappedImage = gesture.location(in: tableView)
        if let indexPath = tableView.indexPathForRow(at: tappedImage){
            print("the (indexPath.row) is: \(indexPath.row)")
            print("the Tapped Image is: \(postImages[indexPath.row])")
            let showImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageViewController") as! ShowImageViewController
            showImageViewController.selectedImage = UIImage(named: postImages[indexPath.row])!
            self.present(showImageViewController, animated: true, completion: nil)
            //self.navigationController?.pushViewController(showImageViewController, animated: true)
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        postImages.remove(at: indexPath.row)
        postUserName.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = HomeTableSection.allCases[indexPath.section]
        switch section {
        case .newsFeed:
            let story = UIStoryboard(name: "ImageViewer", bundle: nil)
            guard let vc = story.instantiateInitialViewController() as? ImageViewer,
                let image = UIImage(named: postImages[indexPath.row]) else {
                return
            }
            vc.imageToView = image
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
