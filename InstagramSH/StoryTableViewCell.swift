//
//  StoryTableViewCell.swift
//  InstagramSH
//
//  Created by Sherif on 7/6/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell, UICollectionViewDelegate , UICollectionViewDataSource{
 
    
    var storyUsername : [String] = ["Your Story" , "Sherif Ashraf" , "Ali" , "Omar" , "Kahraba" ,"Mohamed Ahmed" , "Abdallah" , "Hussein" , "Ahmed Ali" , "Osama"]
    
    var images : [UIImage] = [#imageLiteral(resourceName: "sherif") , #imageLiteral(resourceName: "love_flower") , #imageLiteral(resourceName: "doaa") , #imageLiteral(resourceName: "me") , #imageLiteral(resourceName: "telegram") , #imageLiteral(resourceName: "sherif") , #imageLiteral(resourceName: "post") , #imageLiteral(resourceName: "backButton") ,#imageLiteral(resourceName: "Signup-img") , #imageLiteral(resourceName: "plus_photo")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyUsername.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
         cell.storyButton.setTitle(storyUsername[indexPath.row], for: .normal)
        if (indexPath.row == 0) {
            cell.storyImage.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
            cell.storyButton.setTitleColor(.init(red: 162/255, green: 162/255, blue: 162/255, alpha: 1), for: .normal)
            cell.storyImage.image = images[0]
            cell.addStoryButton.isHidden = false
        }
        else{
            cell.addStoryButton.isHidden = true
            cell.storyButton.setTitleColor(.black, for: .normal)
            cell.storyImage.image = images[indexPath.row]
        }
        return cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    

    

}
