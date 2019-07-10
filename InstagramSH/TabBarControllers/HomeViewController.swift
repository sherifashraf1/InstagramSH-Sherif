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
    var postUserName = ["Sherif Ashraf","Osama Ahmed","Ahmed Mohamed","Mahmoud Fekry","Ehab Nagi","Sherif Ahmed" , "Mohamed Gamal","Omar Ahmed"]
    
    
    enum myTableSection : CaseIterable{ //CaseIterable is a protocol to use the enumu like as array the each case is an indexpath
        case stories                    // indexpath 0
        case newsFeed                   // indexpath 1
        
    }
    
    func changeInstagramTitleAndSizeOnNavBar(){
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Noteworthy-Bold", size: 25) ?? "verdana"]
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeInstagramTitleAndSizeOnNavBar()
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        tableView.registerNib(cell: NewsFeedCell.self)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myTableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = myTableSection.allCases[section] // عايز اعرف هو واقف دلوقتى عند الاسكشن رقم كام
        switch section {
        case .stories :
            return 1
            
        case .newsFeed :
            return postImages.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = myTableSection.allCases[indexPath.section] // عايز اعرف هو واقف دلوقتى عند السكشن رقم كام
        
        switch section {
        case .stories :
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell") as! StoryTableViewCell
            return cell
            
        case .newsFeed :
           // let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
            let cell = tableView.dequeue() as NewsFeedCell
            cell.userPostImage.image = UIImage(named: postImages[indexPath.row])
            cell.userNamePostButton.setTitle(postUserName[indexPath.row], for: .normal)
            cell.selectionStyle =  .none
            
            return cell
        }
        
    }
    
}
