//
//  NewsFeedCell.swift
//  InstagramSH
//
//  Created by Sherif on 7/8/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userNamePostButton: UIButton!
    @IBOutlet weak var threeDotsButton: UIButton!
    @IBOutlet weak var userPostImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var numberOfLikesButton: UIButton!
    @IBOutlet weak var accountProfilePicture: UIImageView!
    @IBOutlet weak var smileEmojiCommentButton: UIButton!
    @IBOutlet weak var heartEmojiCommentButton: UIButton!
    @IBOutlet weak var plusCommentButton: UIButton!
    @IBOutlet weak var timeAgoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        userProfilePicture.layer.cornerRadius = userProfilePicture.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
