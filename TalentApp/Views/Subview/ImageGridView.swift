//
//  ImageGridView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 26/04/2021.
//

import SwiftUI

struct ImageGridView: View {
    
    @ObservedObject var posts: PostArrayObject
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
           
            
            
        ],
                  alignment: .center,
                  spacing: nil,
                  pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/,
                  content: {
                    ForEach(posts.dataArray,id: \.self) { post in
                        
                        NavigationLink(
                            destination: FeedView(posts: PostArrayObject(post: post), title: "Post"),
                            label: {
                                PostViewView(post: post, showHeaderAndFooter: false, addheartAnimationToView: false)                            })
                       
                      
                    }
         
        })
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(posts: PostArrayObject())
            .previewLayout(.sizeThatFits)
    }
}
