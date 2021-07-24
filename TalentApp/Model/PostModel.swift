//
//  PostModel.swift
//  TalentApp
//
//  Created by Emanuele Villani on 20/04/2021.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    
    var id = UUID()
    var postID:String // ID post sarà nel nostro database è l'
    var userID: String // ID for the user in database
    var username: String // username of user in Database
    var caption: String?
    var dateCreate: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //postID
    //userID
    //user username
    //caption - optional
    //date
    //like count
    //liked by curren user
}
