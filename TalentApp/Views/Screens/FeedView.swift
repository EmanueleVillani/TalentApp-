//
//  FeedView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 18/04/2021.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var posts: PostArrayObject
    var title: String
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            LazyHStack {
                ForEach(posts.dataArray, id: \.self) { post in
                    PostViewView(post: post, showHeaderAndFooter: true, addheartAnimationToView: true)
                }
            }
        
        })
        .navigationBarTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        NavigationView{
            FeedView(posts: PostArrayObject(), title: "Feed Test")
        }
       
    }
}
