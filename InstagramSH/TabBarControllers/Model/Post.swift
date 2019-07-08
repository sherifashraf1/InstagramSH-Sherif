//
//  Post.swift
//  InstagramSH
//
//  Created by Sherif on 7/8/19.
//  Copyright © 2019 Sherif. All rights reserved.
//

import Foundation
import UIKit
struct Post {
    var createdBy : User
    var timeAgo : String?
    var caption : String?
    var postImage : UIImage?
    var numberOfLikes : Int?
    var numberOfComments : Int?
    var numberOfShares : Int?
    

    static func fetchPosts() -> [Post]
    {
        var posts = [Post]()
        let sherif = User(userName: "Sherif Ashraf", profileImage: UIImage(named: "sherif"))
        
        let post1 = Post(createdBy: sherif, timeAgo: "2 hr", caption: "Amr Diab is ane o the tap sangsters in the Arab warld an considered a livin legend bi mony o his fans in the Arab warld. He is kent as the Faither o Mediterranean Muisic.In his analysis o The Very Best of Amr Diab album, Victor W. Valdivia o Allmusic said:His music melded traditional Arabic sounds and textures with Western rhythms and instruments. The mesh was dubbed Mediterranean music, and The Very Best of Amr Diab displays Diab's superb skill in creating it.", postImage: UIImage(named: "amr-diab"), numberOfLikes: 250, numberOfComments: 120, numberOfShares: 50)
        
        let post2 = Post(createdBy: sherif, timeAgo: "3 hr" , caption: "Cristiano Ronaldo is my fav player in the world, i love him very much. and he is a wounderful player", postImage: UIImage(named: "cristiano"), numberOfLikes: 150, numberOfComments: 30, numberOfShares: 10)
        
        let post3 = Post(createdBy: sherif, timeAgo: "5 hr", caption: "neymar is a specific player in the world, i love him very much. and he is a wounderful player", postImage: UIImage(named: "neymar"), numberOfLikes: 150, numberOfComments: 30, numberOfShares: 10)
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        return posts
    }
}

