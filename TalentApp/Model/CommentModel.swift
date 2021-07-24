//
//  CommentModel.swift
//  TalentApp
//
//  Created by Emanuele Villani on 21/04/2021.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String // ID fro the comment in the DatatBase
    var userID : String // ID for the user in the Database
    var username: String // Username for the user in the database
    var content: String // Actually comment text
    var dateCreared: Date // creazione per ordinare tutto in data
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
