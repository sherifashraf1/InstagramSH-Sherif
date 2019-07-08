//
//  HomeViewController.swift
//  InstagramSH
//
//  Created by Sherif on 7/5/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    var postImages : [String] = ["doaa" , "essam" , "me" , "sherif" , "amr_diab" , "hands" , "neymar" ,"cristiano"]

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Noteworthy-Bold", size: 20)]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0 :
            return 1

        case 1:
            return postImages.count
        default:
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell") as! StoryTableViewCell
            return cell
//
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PostHeaderTableViewCell") as! PostHeaderTableViewCell
//            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell" ) as! PostTableViewCell
            cell.postImageView.image = UIImage(named: postImages[indexPath.row])
            cell.selectionStyle = .none
            return cell
        default:
        
            return UITableViewCell()
        }
        
        
    }
    
    

    
}
