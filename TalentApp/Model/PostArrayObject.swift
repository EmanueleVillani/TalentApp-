//
//  PostArrayObject.swift
//  TalentApp
//
//  Created by Emanuele Villani on 20/04/2021.
//

import Foundation

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel] ()
    
    init() {
        
        print ("fetch from database here")
        
        
        let post1 = PostModel(postID: "", userID: "", username: "Emanuele Villani", caption: "This is a caption", dateCreate: Date(), likeCount: 0, likedByUser: false)
        
        let post2 = PostModel(postID: "", userID: "", username: "Carlo Matroiani", caption:nil, dateCreate: Date(), likeCount: 0, likedByUser: false)
        
        let post3 = PostModel(postID: "", userID: "", username: "Iron Man", caption: "This is a caption hahahaha", dateCreate: Date(), likeCount: 0, likedByUser: false)
        
        let post4 = PostModel(postID: "", userID: "", username: "Bat Man", caption: "This is a caption hahahaha", dateCreate: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    /// USED FOR SINGLE POST SELECTION
    init (post: PostModel){
        self.dataArray.append(post)
    }
}
