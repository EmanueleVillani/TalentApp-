//
//  ProfileIView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 27/04/2021.
//

import SwiftUI

struct ProfileIView: View {
    @Environment(\.colorScheme) var colorScheme
    var isMyProfile: Bool
    @State var profileDisplayName: String
    var profileUserID: String
    
    
    var posts = PostArrayObject()
    
    @State var showSettings: Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            
            ImageGridView(posts: posts)
        })
        .navigationBarTitle(loc("PROFILE"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    showSettings.toggle()
                                }, label: {
                                    Image(systemName: "line.horizontal.3")
                                })
                                .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor: Color.MyTheme.yellowColor)
                                
                                .opacity(isMyProfile ? 1.0 :0.0)
        )
        .sheet(isPresented: $showSettings, content: {
            SettingsView()
                .preferredColorScheme(colorScheme)
        })
    }
}

struct ProfileIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileIView(isMyProfile: true, profileDisplayName: "Emanuele", profileUserID: "")
                .preferredColorScheme(.dark)
        }
    }
}
