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
    
    var storyImages : [UIImage] = [#imageLiteral(resourceName: "sherif") , #imageLiteral(resourceName: "love_flower") , #imageLiteral(resourceName: "doaa") , #imageLiteral(resourceName: "me") , #imageLiteral(resourceName: "telegram") , #imageLiteral(resourceName: "sherif") , #imageLiteral(resourceName: "post") , #imageLiteral(resourceName: "backButton") ,#imageLiteral(resourceName: "Signup-img") , #imageLiteral(resourceName: "plus_photo")]
    
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
            cell.storyImage.layer.borderWidth = 2
            cell.storyImage.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
            cell.storyImage.image = storyImages[0]
            cell.addStoryButton.isHidden = false
        }
        else{
            cell.storyImage.layer.borderWidth = 3
            cell.storyImage.layer.borderColor = UIColor.purple.cgColor
            cell.addStoryButton.isHidden = true
            cell.storyImage.image = storyImages[indexPath.row]

        }
        return cell
    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let imageView = UIImageView(image: UIImage(named: storyImages[indexPath.row]))
//        imageView.frame = self.view.frame
//        imageView.backgroundColor = .black
//        imageView.contentMode = .top
//        imageView.isUserInteractionEnabled = true
//        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
//        imageView.addGestureRecognizer(tap)
//        
//        self.view.addSubview(imageView)
//    }
//    
//    // Use to back from full mode
//   @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
//        sender.view?.removeFromSuperview()
//
//    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         selectionStyle = .none
        
    }
    

    

}
