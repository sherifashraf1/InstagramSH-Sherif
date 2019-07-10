//
//  StoryCollectionViewCell.swift
//  InstagramSH
//
//  Created by Sherif on 7/6/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit
import Foundation

class StoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyButton: UIButton!
    @IBOutlet weak var addStoryButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        storyImage.layer.cornerRadius = storyImage.frame.width / 2

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //storyImage.image = nil
        //storyButton.isHidden = true
    }

    
    
}
