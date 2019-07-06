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
    //var imageUser : [UIImage] = ["grid.png" , "gear.png" , "list.png"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self

    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyUsername.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
         cell.storyButton.setTitle(storyUsername[indexPath.row], for: .normal) as? String
        if (indexPath.row == 0) {
            cell.storyImage.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
            cell.storyButton.setTitleColor(.init(red: 162/255, green: 162/255, blue: 162/255, alpha: 1), for: .normal)
            cell.storyImage.image = UIImage(named: "sherif")
            
            let imageview:UIImageView = UIImageView(frame : CGRect(x: 65, y: 60, width: 20, height: 20))
            let image:UIImage = UIImage(named: "storyplus")!
            imageview.image = image
            imageview.contentMode = .scaleAspectFit
            cell.contentView.addSubview(imageview) as? UIImage
        }
        
        return cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    

    

}
