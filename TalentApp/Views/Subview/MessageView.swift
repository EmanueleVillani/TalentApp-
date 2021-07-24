//
//  MessageView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 21/04/2021.
//

import SwiftUI

struct MessageView: View {
    @State var comment: CommentModel
    
    var body: some View {
        
        
        HStack {
            // Profilo immagine
            // Immagine del profilo arrotondata
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4, content: {
                // User name
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                // Content
                Text(comment.content)
                    .padding(.all,10)
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
            })
            
            Spacer(minLength: 0)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Emanuele Villani", content: "This  photo is reallly coll.hahaha", dateCreared: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
