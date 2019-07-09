//
//  NewsFeedCell.swift
//  InstagramSH
//
//  Created by Sherif on 7/8/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell , UITextViewDelegate {
    
    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userNamePostButton: UIButton!
    @IBOutlet weak var threeDotsButton: UIButton!
    @IBOutlet weak var userPostImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var numberOfLikesButton: UIButton!
    @IBOutlet weak var postCaptionLabel: UILabel!
    @IBOutlet weak var accountProfilePicture: UIImageView!
    @IBOutlet weak var addCommentTextView: UITextView!
    @IBOutlet weak var smileEmojiCommentButton: UIButton!
    @IBOutlet weak var heartEmojiCommentButton: UIButton!
    @IBOutlet weak var plusEmojiCommentButton: UIButton!
    @IBOutlet weak var timeAgoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        userProfilePicture.layer.cornerRadius = userProfilePicture.frame.width / 2
        addCommentConfigTextView()
    }

    func addCommentConfigTextView(){
        addCommentTextView.showsVerticalScrollIndicator = false
        addCommentTextView.text = "Add a comment..."
        addCommentTextView.textColor = .lightGray
        addCommentTextView.font = UIFont(name: "verdana", size: 13.0)
        addCommentTextView.returnKeyType = .done
        addCommentTextView.delegate = self

    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Add a comment..." {
            textView.text = ""
            textView.textColor = .black
            textView.font = UIFont(name: "verdana", size: 13.0)

        }

    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Add a comment..."
            textView.textColor = .lightGray
            textView.font = UIFont(name: "verdana", size: 13.0)

        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

