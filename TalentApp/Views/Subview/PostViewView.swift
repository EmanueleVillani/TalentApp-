//
//  PostViewView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 18/04/2021.
//

import SwiftUI

struct PostViewView: View {
    
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    @State var postImage: UIImage = UIImage(named: "developer1")!
    
    @State var animateLike: Bool = false
    
    @State var showActionSheet: Bool = false
    
    @State var addheartAnimationToView: Bool
    
    @State var actionSheetType: PostActionSheetOptiom = .general
    
    enum PostActionSheetOptiom {
        case general
        case reporting
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
           
            // MARK: HEADER
            if showHeaderAndFooter{
                HStack {
                    
                    // NavigationLink premere l'immagine del profilo e indirizzarlo al profilo utente
                    NavigationLink(
                        destination: ProfileIView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID),
                        label: {
                            Image("developer1") // abbiamo settato l'immagine
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30, alignment: .center)
                                .cornerRadius(15)
                            
                            Text(post.username)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                        })
                   
                    
                    Spacer()
                    
                    Button(action: {
                        showActionSheet.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                    .accentColor(.primary)
                    .actionSheet(isPresented: $showActionSheet, content: {
                        getActionSheet()
                    })
                   
                }
                .padding(.all,6)// Abbiamo aggiunto un paddind per aggiungere l'immagine sotto all'user Name utente
                
            }
            
            // MARK: IMAGE
            
            ZStack{
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
                if addheartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
                
               
            }
            
            
            
            // MARK: FOOTER
            if showHeaderAndFooter {
                //aggiunto le icone sotto al post utente per poter aggiungere i like, scrivere MSG e rispondere.
                HStack(alignment: .center, spacing: 20, content: {
                    
                    
                    Button(action: {
                        if post.likedByUser {
                            //unlike
                            unlikePost()
                        }else{
                            //like post
                            likePost()
                        }
                        
                    }, label: {
                        Image(systemName: post.likedByUser ? "star.fill" : "star")
                            .font(.title3)
                    })
                    .accentColor(post.likedByUser ? .yellow: .primary)
                    
                    // MARK: COMMET ICON
                    NavigationLink(
                        destination: Comments(),
                        label: {
                            Image(systemName: "bubble.middle.bottom")
                                .font(.title3)
                                .foregroundColor(.primary)
                        })
                   
                    Button(action: {
                        sharePost()
                        
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    })
                    .accentColor(.primary)
                        
                    
                    Spacer()
                })

                .padding(.all,6)
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        
                        Spacer(minLength: 0)
                }
                    .padding(.all,6)
                }
            }
          
           
        })
    }
    
    // MARK: FUNCTIONS
    
    func likePost() {
        // Update the local date
        
        let updatePost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreate: post.dateCreate, likeCount: post.likeCount + 1, likedByUser: true)
        
        self.post = updatePost
        
        animateLike = true
        DispatchQueue.main.asyncAfter (deadline: .now() + 0.5) {
            animateLike = false
        }
    }
    
    func unlikePost() {
        let updatePost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreate: post.dateCreate, likeCount: post.likeCount + 1, likedByUser: false)
        
        self.post = updatePost
        
    }
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType {
        case .general:
            return ActionSheet(title: Text( "What would you like to do?"), message: nil, buttons: [
                .destructive(Text("Report"), action: {
                
                    self.actionSheetType = .reporting/*
                    Quindi, quando facciamo clic su questo pulsante di segnalazione, chiuderà il foglio di azione corrente, fruscio, cambierà il file*/
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }
                   
            }),
                
            .default(Text("Learn more..."), action: {
                print("LEARN MORE PRESSED")
            }),
            .cancel()
                                           
            ])
        case .reporting:
        
        return ActionSheet(title: Text("Why are your reporting this post?"), message: nil, buttons: [
            
            .destructive(Text("This is inapproriete"), action: {
                reportPost(reason: "THIS IS innaproprite")
            }),
            .destructive(Text("This is spam"), action: {
                reportPost(reason: "This is  spma")
            }),
            .destructive(Text("It made me uncomfortable"), action: {
                reportPost(reason: "It made me uncomfortable")
            }),
            .cancel({
                self.actionSheetType = .general
            })
        ])
       
        }
      
       
    }
    
    func reportPost(reason: String) {
        print("REPORT POST NOW")
    }
    
    func sharePost() {
        let message = "Check out post on TalentApp!"
        let image = postImage
        let link = URL(string: "htt://www.google.com")!
        
      let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
        
    }
    
}

struct PostViewView_Previews: PreviewProvider {
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Emanuele Villani", caption: nil, dateCreate: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostViewView(post: post, showHeaderAndFooter: true, addheartAnimationToView: true)
            .previewLayout(.sizeThatFits)//questo viene uttilizzato per generare un insiemi d' oggetti da inserire nelle view di preferenza
    }
}
