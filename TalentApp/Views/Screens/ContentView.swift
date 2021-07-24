//
//  ContentView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 17/04/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var currentUserID: String? = nil //per non usare la password e mail , basta togliere il valore (nil) inserire ("")
    
    var body: some View {
        TabView {
            NavigationView { // aggiungiamo un NVW e aggiungiamo la nostra feedView nella struct CONTENDVIEW
                
                FeedView(posts: PostArrayObject(), title: "Feed")
                Image("logo.transparent")
            }
           
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
            
            NavigationView {
                BrowseView()
            }
          
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            Text("Scroeen 3 CHALLENGES ")
                .tabItem{
                    Image(systemName: "star")
                    Text(loc("SFIDA"))
                    
                    
                }
            
            
           UploadView()
                .tabItem{
                    Image(systemName: "square.and.arrow.up.fill")
                    Text(loc("CARICAREITEM"))
                }
            
            ZStack {
                if currentUserID != nil {
                    NavigationView{
                        ProfileIView(isMyProfile: true, profileDisplayName: "My Profile", profileUserID: "")
                    }
                }else{
                    SignUpView()
                  }
                }
               
            
                .tabItem{
                    Image(systemName: "person.fill")
                    Text(loc("PROFILE"))
                    
                    
                }
            
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor: Color.MyTheme.yellowColor )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark
            )
    }
}
