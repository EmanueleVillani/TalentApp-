//
//  Comments.swift
//  TalentApp
//
//  Created by Emanuele Villani on 21/04/2021.
//

import SwiftUI

struct Comments: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVStack{
                    //forEach
                    ForEach(commentArray, id: \.self)  {comment in
                        MessageView(comment: comment)
                        
                    }
                }
            }
            
            HStack {
                //immagine piccola lato sinistra del textField
                Image("developer2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here...", text: $submissionText)
               //Button invio testo
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor: Color.MyTheme.yellowColor)
                
               
            }
            .padding(.all,6)
        }
        .padding(.horizontal)
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            getComments()
        })
    
}
  // Mark: Functions
    
    func getComments()  {
        
        print("GET COMMENDS FROM DATABASE")
        
        let comment1 = CommentModel(commentID: "", userID: "", username: "Emanuele Villani", content: "THIS IS FIRST COMMENT", dateCreared: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "Simon Le Bon", content: "THIS IS SECOND COMMENT", dateCreared: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Iron Man", content: "THIS IS THIRD COMMENT", dateCreared: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
      
    }
    
}
struct Comments_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Comments()
                .preferredColorScheme(.dark)
        }
        
    }
}

